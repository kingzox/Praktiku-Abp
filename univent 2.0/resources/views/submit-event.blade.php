@extends('layouts.app')

@section('title', (isset($event) ? 'Edit Event' : 'Submit Event') . ' - Univent')

@section('content')
@auth
    @php
        $isEditMode = isset($event);
        $formAction = $isEditMode ? route('submit-event.update', $event->id) : route('submit-event');
    @endphp
    <div class="absolute -top-24 -left-24 w-96 h-96 bg-red-100 rounded-full blur-3xl opacity-80 -z-10"></div>
    <div class="absolute top-1/2 -right-24 w-80 h-80 bg-pink-100 rounded-full blur-3xl opacity-60 -z-10"></div>

    
    <div class="min-h-screen pt-28 pb-20 px-4 bg-slate-50/50">
        <div class="max-w-3xl mx-auto bg-white rounded-[2.5rem] border border-slate-100 shadow-xl shadow-slate-200/50 overflow-hidden p-8 md:p-12">
            
            {{-- Header --}}
            <div class="mb-10 text-center md:text-left">
                <h1 class="text-3xl font-extrabold text-slate-900 mb-2">{{ $isEditMode ? 'Edit Event' : 'Submit Event' }}</h1>
                <p class="text-slate-500 font-medium">Share your event with the Telkom University Purwokerto community. All fields marked with <span class="text-red-500">*</span> are required.</p>
            </div>

            <form action="{{ $formAction }}" method="POST" enctype="multipart/form-data" class="space-y-8">
                @csrf
                @if ($isEditMode) @method('PUT') @endif

                {{-- Basic Info Section --}}
                <div class="space-y-6">
                    <div class="space-y-2">
                        <label for="event_title" class="text-sm font-bold text-slate-700">Event Title <span class="text-red-500">*</span></label>
                        <input type="text" id="event_title" name="event_title" required
                            value="{{ old('event_title', $event->event_title ?? '') }}"
                            class="w-full px-5 py-3.5 bg-slate-50 border border-slate-200 rounded-2xl text-sm focus:ring-2 focus:ring-red-400 focus:border-red-400 outline-none transition-all"
                            placeholder="Enter Event Title">
                    </div>

                    <div class="space-y-2">
                        <label for="organizer_name" class="text-sm font-bold text-slate-700">Organizer Name <span class="text-red-500">*</span></label>
                        <input type="text" id="organizer_name" name="organizer_name" required 
                            value="{{ old('organizer_name', $event->organizer_name ?? '') }}"
                            class="w-full px-5 py-3.5 bg-slate-50 border border-slate-200 rounded-2xl text-sm focus:ring-2 focus:ring-red-400 focus:border-red-400 outline-none transition-all"
                            placeholder="Enter Organizer Title">
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        {{-- Organizer Type Dropdown --}}
                        <div class="space-y-2" x-data="{ open: false, selected: '{{ old('organizer_type', $event->organizer_type ?? 'Select Type') }}' }">
                            <label class="text-sm font-bold text-slate-700">Organizer Type <span class="text-red-500">*</span></label>
                            <div class="relative">
                                <button type="button" @click="open = !open" class="w-full flex items-center justify-between px-5 py-3.5 bg-slate-50 border border-slate-200 rounded-2xl text-sm text-slate-700">
                                    <span x-text="selected === 'student_association' ? 'Student Association' : (selected === 'lecturer' ? 'Lecturer' : (selected === 'external' ? 'External' : selected))"></span>
                                    <svg class="w-4 h-4 text-slate-400 transition-transform" :class="open ? 'rotate-180' : ''" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M19 9l-7 7-7-7"/></svg>
                                </button>
                                <input type="hidden" name="organizer_type" x-model="selected">
                                <div x-show="open" @click.away="open = false" class="absolute z-30 mt-2 w-full bg-white border border-slate-100 rounded-2xl shadow-xl py-2" x-cloak>
                                    @foreach(['student_association' => 'Student Association', 'lecturer' => 'Lecturer', 'external' => 'External'] as $val => $label)
                                        <button type="button" @click="selected = '{{ $val }}'; open = false" class="w-full text-left px-5 py-2.5 text-sm text-slate-600 hover:bg-red-50 hover:text-red-600 transition-colors">{{ $label }}</button>
                                    @endforeach
                                </div>
                            </div>
                        </div>

                        {{-- Category Dropdown --}}
                        <div class="space-y-2" x-data="{ open: false, selected: '{{ old('event_category', $event->event_category ?? 'Select Category') }}' }">
                            <label class="text-sm font-bold text-slate-700">Event Category <span class="text-red-500">*</span></label>
                            <div class="relative">
                                <button type="button" @click="open = !open" class="w-full flex items-center justify-between px-5 py-3.5 bg-slate-50 border border-slate-200 rounded-2xl text-sm text-slate-700 capitalize">
                                    <span x-text="selected"></span>
                                    <svg class="w-4 h-4 text-slate-400 transition-transform" :class="open ? 'rotate-180' : ''" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M19 9l-7 7-7-7"/></svg>
                                </button>
                                <input type="hidden" name="event_category" x-model="selected">
                                <div x-show="open" @click.away="open = false" class="absolute z-30 mt-2 w-full bg-white border border-slate-100 rounded-2xl shadow-xl py-2" x-cloak>
                                    @foreach(['seminar', 'workshop', 'competition', 'gathering', 'other'] as $cat)
                                        <button type="button" @click="selected = '{{ $cat }}'; open = false" class="w-full text-left px-5 py-2.5 text-sm text-slate-600 hover:bg-red-50 hover:text-red-600 transition-colors capitalize">{{ $cat }}</button>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- Schedule Section --}}
                <div class="p-6 bg-slate-50/50 rounded-[2rem] space-y-6">
                    <h3 class="text-sm font-black uppercase tracking-widest text-slate-400 mb-4">Event Schedule</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div class="space-y-2">
                            <label for="start_date" class="text-xs font-bold text-slate-500">Start Date <span class="text-red-500">*</span></label>
                            <input type="date" id="start_date" name="start_date" required value="{{ old('start_date', $event->start_date ?? '') }}" class="w-full px-4 py-3 bg-white border border-slate-200 rounded-xl text-sm focus:ring-2 focus:ring-red-400 outline-none">
                        </div>
                        <div class="space-y-2">
                            <label for="start_time" class="text-xs font-bold text-slate-500">Start Time <span class="text-red-500">*</span></label>
                            <input type="time" id="start_time" name="start_time" required value="{{ old('start_time', $event->start_time ?? '') }}" class="w-full px-4 py-3 bg-white border border-slate-200 rounded-xl text-sm focus:ring-2 focus:ring-red-400 outline-none">
                        </div>
                        <div class="space-y-2">
                            <label for="end_date" class="text-xs font-bold text-slate-500">End Date <span class="text-red-500">*</span></label>
                            <input type="date" id="end_date" name="end_date" required value="{{ old('end_date', $event->end_date ?? '') }}" class="w-full px-4 py-3 bg-white border border-slate-200 rounded-xl text-sm focus:ring-2 focus:ring-red-400 outline-none">
                        </div>
                        <div class="space-y-2">
                            <label for="end_time" class="text-xs font-bold text-slate-500">End Time <span class="text-red-500">*</span></label>
                            <input type="time" id="end_time" name="end_time" required value="{{ old('end_time', $event->end_time ?? '') }}" class="w-full px-4 py-3 bg-white border border-slate-200 rounded-xl text-sm focus:ring-2 focus:ring-red-400 outline-none">
                        </div>
                    </div>
                </div>

                {{-- Additional Info --}}
                <div class="space-y-6">
                    <div class="space-y-2">
                        <label for="event_description" class="text-sm font-bold text-slate-700">Description <span class="text-red-500">*</span></label>
                        <textarea id="event_description" name="event_description" rows="5" required class="w-full px-5 py-3.5 bg-slate-50 border border-slate-200 rounded-2xl text-sm focus:ring-2 focus:ring-red-400 outline-none resize-none" placeholder="Describe your event...">{{ old('event_description', $event->event_description ?? '') }}</textarea>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div class="space-y-2">
                            <label for="event_location" class="text-sm font-bold text-slate-700">Location <span class="text-red-500">*</span></label>
                            <input type="text" id="event_location" name="event_location" required value="{{ old('event_location', $event->event_location ?? '') }}" class="w-full px-5 py-3.5 bg-slate-50 border border-slate-200 rounded-2xl text-sm focus:ring-2 focus:ring-red-400 outline-none" placeholder="Enter Location">
                        </div>
                        <div class="space-y-2">
                            <label for="contact_person" class="text-sm font-bold text-slate-700">Contact Person <span class="text-red-500">*</span></label>
                            <input type="text" id="contact_person" name="contact_person" required value="{{ old('contact_person', $event->contact_person ?? '') }}" class="w-full px-5 py-3.5 bg-slate-50 border border-slate-200 rounded-2xl text-sm focus:ring-2 focus:ring-red-400 outline-none" placeholder="Name (WhatsApp)">
                        </div>
                    </div>

                    <div class="space-y-2">
                        <label for="registration_link" class="text-sm font-bold text-slate-700">Registration Link</label>
                        <input type="url" id="registration_link" name="registration_link" value="{{ old('registration_link', $event->registration_link ?? '') }}" class="w-full px-5 py-3.5 bg-slate-50 border border-slate-200 rounded-2xl text-sm focus:ring-2 focus:ring-red-400 outline-none" placeholder="https://...">
                    </div>
                </div>

                {{-- Poster Upload --}}
                    <div class="space-y-2">
                        <label class="text-sm font-bold text-slate-700">Event Poster <span class="text-red-500">*</span></label>
                        <div class="relative group" x-data="{ imagePreview: '{{ isset($event->event_poster) ? 'data:image/jpeg;base64,' . $event->event_poster : '' }}' }">
                            {{-- Input File --}}
                            <input type="file" name="event_poster" id="event_poster" 
                                class="absolute inset-0 w-full h-full opacity-0 z-20 cursor-pointer" 
                                accept="image/*" 
                                @change="const file = $event.target.files[0]; if (file) { const reader = new FileReader(); reader.onload = (e) => { imagePreview = e.target.result }; reader.readAsDataURL(file); }">
                            
                            {{-- Box Kontainer --}}
                            <div class="border-2 border-dashed border-slate-200 rounded-[2rem] p-10 flex flex-col items-center justify-center bg-slate-50 group-hover:bg-red-50 transition-all relative z-10">
                                
                                {{-- Ikon Default (Hilang jika ada preview) --}}
                                <template x-if="!imagePreview">
                                    <div class="flex flex-col items-center">
                                        <div class="w-16 h-16 bg-white rounded-2xl shadow-sm flex items-center justify-center mb-4 text-red-500">
                                            <x-heroicon-o-arrow-up-tray class="w-8 h-8" />
                                        </div>
                                        <p class="text-sm font-bold text-slate-700">Drag & drop your file here</p>
                                        <p class="text-xs text-slate-400 mt-1">PNG, JPG up to 4MB</p>
                                    </div>
                                </template>
                                
                                {{-- Box Preview (Tampil jika imagePreview terisi) --}}
                                <template x-if="imagePreview">
                                    <div class="relative w-full flex flex-col items-center">
                                        <div class="p-2 bg-white rounded-2xl shadow-md border border-slate-100 max-w-xs overflow-hidden">
                                            <img :src="imagePreview" class="w-full h-48 object-cover rounded-xl shadow-inner">
                                        </div>
                                        <p class="mt-4 text-xs font-bold text-red-500 bg-red-50 px-3 py-1 rounded-full">Click or drag to change image</p>
                                    </div>
                                </template>
                            </div>
                        </div>
                    </div>

                {{-- Form Buttons --}}
                <div class="flex flex-col md:flex-row items-center justify-end gap-4 pt-6 border-t border-slate-100">
                    <button type="reset" class="w-full md:w-auto px-8 py-4 text-sm font-bold text-slate-500 hover:text-red-500 transition-colors">Clear Form</button>
                    <button type="submit" class="w-full md:w-auto px-10 py-4 bg-gradient-to-r from-red-600 to-pink-500 text-white font-bold rounded-2xl shadow-lg shadow-pink-500/25 hover:scale-105 active:scale-95 transition transform">
                        {{ $isEditMode ? 'Update Event' : 'Submit Event' }}
                    </button>
                </div>
            </form>
        </div>
    </div>
@endauth
@endsection