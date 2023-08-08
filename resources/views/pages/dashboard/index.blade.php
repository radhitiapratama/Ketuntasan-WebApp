@extends('layout.main')

@section('content')
    <h1>{{ auth()->user()->username }}</h1>
@endsection
