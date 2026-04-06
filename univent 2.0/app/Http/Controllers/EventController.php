<?php

namespace App\Http\Controllers;

use App\Models\Event;
use App\Models\EventRegistration;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View; // Import wajib untuk Return Type
use Illuminate\Http\RedirectResponse; // Import wajib untuk Return Type

class EventController extends Controller
{
    public function __construct()
    {
        // Hanya method tertentu yang perlu login
        $this->middleware('auth')->only([
            'create',
            'store',
            'update',
            'showHistory',
            'showRegistration',
        ]);
    }

    // Fix: Method ini bawaan Laravel untuk unauthenticated, biarkan return type ?string
    protected function redirectTo(Request $request): ?string
    {
        return $request->expectsJson() ? null : route('login');
    }

    // Tampilkan form submit event (untuk create ATAU edit)
    // Fix: Return type bisa View atau RedirectResponse (jika error redirect)
    public function create(Request $request): View|RedirectResponse
    {
        $event = null;

        if ($request->has('edit')) {
            $eventId = $request->query('edit');
            /** @var Event $event */
            $event = Event::findOrFail($eventId);

            // Otorisasi: Pastikan event ini milik user yang sedang login
            $isOwner = EventRegistration::where('event_id', $event->id)
                ->where('user_id', Auth::id())
                ->exists();

            if (! $isOwner) {
                return redirect()->route('user.event.history')->with('error', 'Anda tidak berhak mengubah event ini.');
            }

            // Otorisasi: Pastikan event tersebut belum disetujui
            if ($event->status !== 'pending') {
                return redirect()->route('user.event.history')->with('error', 'Event yang sudah disetujui tidak dapat diubah.');
            }
        }

        return view('submit-event', compact('event'));
    }

    // --------------------------
    // SIMPAN EVENT BARU (BASE64)
    // --------------------------
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'event_title' => 'required|string|max:255',
            'organizer_name' => 'required|string|max:255',
            'organizer_type' => 'required|string',
            'event_category' => 'required|string',
            'event_description' => 'required|string',
            'start_date' => 'required|date',
            'start_time' => 'required',
            'end_date' => 'required|date|after_or_equal:start_date',
            'end_time' => 'required',
            'event_location' => 'required|string',
            'registration_link' => 'nullable|url',
            'contact_person' => 'required|string',
            'event_poster' => 'nullable|image|mimes:jpg,jpeg,png|max:4096',
        ]);

        // Simpan poster sebagai BASE64
        $posterData = null;

        if ($request->hasFile('event_poster')) {
            // Fix: Strict handling untuk file_get_contents agar PHPStan tidak error "expects string, false given"
            $file = $request->file('event_poster');
            if ($file && $file->getRealPath()) {
                $content = file_get_contents($file->getRealPath());
                if ($content !== false) {
                    $posterData = base64_encode($content);
                }
            }
        }

        /** @var Event $event */
        $event = Event::create([
            'user_id' => Auth::id(),
            'event_title' => $request->event_title,
            'organizer_name' => $request->organizer_name,
            'organizer_type' => $request->organizer_type,
            'event_category' => $request->event_category,
            'event_description' => $request->event_description,
            'start_date' => $request->start_date,
            'start_time' => $request->start_time,
            'end_date' => $request->end_date,
            'end_time' => $request->end_time,
            'event_location' => $request->event_location,
            'registration_link' => $request->registration_link,
            'contact_person' => $request->contact_person,
            'event_poster' => $posterData, // BASE64 poster
            'status' => 'pending',
        ]);

        if (Auth::check()) {
            EventRegistration::create([
                'user_id' => Auth::id(),
                'event_id' => $event->id,
                'status' => 'pending',
            ]);
        }

        return redirect()->route('dashboard')->with('success', 'Event berhasil disubmit dan terdaftar!');
    }

    // ---------------------------
    // UPDATE EVENT (BASE64 POSTER)
    // ---------------------------
    // Fix: Tambahkan tipe parameter int $id dan return type
    public function update(Request $request, int $id): RedirectResponse
    {
        $request->validate([
            'event_title' => 'required|string|max:255',
            'organizer_name' => 'required|string|max:255',
            'organizer_type' => 'required|string',
            'event_category' => 'required|string',
            'event_description' => 'required|string',
            'start_date' => 'required|date',
            'start_time' => 'required',
            'end_date' => 'required|date|after_or_equal:start_date',
            'end_time' => 'required',
            'event_location' => 'required|string',
            'registration_link' => 'nullable|url',
            'contact_person' => 'required|string',
            'event_poster' => 'nullable|image|mimes:jpg,jpeg,png|max:4096',
        ]);

        $event = Event::findOrFail($id);

        // Otorisasi
        if ($event->status !== 'pending') {
            return redirect()->route('user.event.history')->with('error', 'Event yang sudah disetujui tidak dapat diubah.');
        }

        $isOwner = EventRegistration::where('event_id', $event->id)
            ->where('user_id', Auth::id())
            ->exists();

        if (! $isOwner) {
            return redirect()->route('user.event.history')->with('error', 'Anda tidak berhak mengubah event ini.');
        }

        // Poster default = poster lama
        $posterData = $event->event_poster;

        // Jika poster baru diupload → ganti ke BASE64 baru
        if ($request->hasFile('event_poster')) {
            // Fix: Strict handling sama seperti store()
            $file = $request->file('event_poster');
            if ($file && $file->getRealPath()) {
                $content = file_get_contents($file->getRealPath());
                if ($content !== false) {
                    $posterData = base64_encode($content);
                }
            }
        }

        // Update event
        $event->update([
            'event_title' => $request->event_title,
            'organizer_name' => $request->organizer_name,
            'organizer_type' => $request->organizer_type,
            'event_category' => $request->event_category,
            'event_description' => $request->event_description,
            'start_date' => $request->start_date,
            'start_time' => $request->start_time,
            'end_date' => $request->end_date,
            'end_time' => $request->end_time,
            'event_location' => $request->event_location,
            'registration_link' => $request->registration_link,
            'contact_person' => $request->contact_person,
            'event_poster' => $posterData, // BASE64 poster disimpan
        ]);

        return redirect()->route('user.event.history')->with('success', 'Event berhasil diperbarui!');
    }

    // --------------------------
    // Bagian lain tetap sama
    // --------------------------

    public function index(): View
    {
        $events = \App\Models\Event::where('status', 'approved')->latest()->get();

        return view('dashboard.dashboard', compact('events'));
    }

    // Fix: Tambahkan tipe parameter int $id
    public function show(int $id): View
    {
        $event = Event::findOrFail($id);

        return view('event-detail', compact('event'));
    }

    public function browse(): View
    {
        $events = \App\Models\Event::where('status', 'approved')->latest()->get();

        return view('browse-events', compact('events'));
    }

    public function showHistory(): View|RedirectResponse
    {
        if (! Auth::check()) {
            return redirect()->route('login');
        }
        $userId = Auth::id();
        $registrations = EventRegistration::where('user_id', $userId)
            ->with('event')
            ->latest()
            ->paginate(10);

        return view('event-history', compact('registrations'));
    }

    // Fix: Tambahkan tipe parameter int $id
    public function showRegistration(int $id): View
    {
        $registration = EventRegistration::with('event')
            ->where('user_id', Auth::id())
            ->findOrFail($id);

        return view('registration-detail', compact('registration'));
    }
}