@extends('layouts.app')
@section('content')
<div class="container">
    <h1>Edit {{ $user->name }}</h1>
<form action="{{ route('users.update',$user->id ) }}" method="POST">
    @csrf
    @method('PUT')
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Your name</label>
        <input type="text" name ="name" value="{{ old('name') ?? $user->name}}"  class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
      </div>
      @error('name')
        <div class="text-danger">{{ $message }}</div>
          
      @enderror
    <div class="mb-3">
      <label for="exampleInputEmail1" class="form-label">Email</label>
      <input type="email" name ="email" value="{{ old('email') ?? $user->email}}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    </div>
    @error('email')
    <div class="text-danger">{{ $message }}</div>
      
  @enderror
    <div class="mb-3">
      <label for="exampleInputPassword1" class="form-label">Password</label>
      <input type="password" name="password"class="form-control" id="exampleInputPassword1">
    </div>
    @error('password')
    <div class="text-danger">{{ $message }}</div>
      
  @enderror
    <button type="submit" class="btn btn-primary">Update</button>
  </form>
</div>
@endsection