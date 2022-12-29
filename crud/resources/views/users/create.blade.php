@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Create User</h1>


<form action="{{ route('users.store') }}" method="POST">
    @csrf
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Name</label>
        <input type="text" name="name" value=" {{ old('name') }} " class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    </div>
    <div>
      @error('name')
          <div class="text-danger">
              {{ $message }}
          </div>
      @enderror
    </div>
    <div class="mb-3">
      <label for="exampleInputEmail1" class="form-label">Email</label>
      <input type="email" name="email" value=" {{ old('email') }} " class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    </div>
    <div>
      @error('email')
          <div class="text-danger">
              {{ $message }}
          </div>
      @enderror
    </div>
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Address</label>
        <textarea name="address" value=" {{ old('address') }} " class="form-control"></textarea>
    </div>
    <div>
      @error('address')
          <div class="text-danger">
              {{ $message }}
          </div>
      @enderror
    </div>
    <div class="mb-3">
      <label for="exampleInputPassword1" class="form-label">Password</label>
      <input type="password" name="password" value=" {{ old('address') }} " class="form-control" id="exampleInputPassword1">
    </div>
    <div>
      @error('password')
          <div class="text-danger">
              {{ $message }}
          </div>
      @enderror
    </div>
    
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
@endsection