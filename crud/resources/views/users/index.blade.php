@extends('layouts.app')

@section('content')
    <div class="container">

        @if (session('message'))
        <div class="alert alert-primary" role="alert">
            {{ session('message') }}
        </div>
        @endif

        <div>
            <h1>LIST USER</h1>
        </div>
        <div>
            <a href="{{ route('users.create') }}" class="btn btn-primary"> Create </a>
        </div>
        <div>
            <table class="table table hover">
                <thead>
                    <th>#</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Address</th>
                </thead>

                <tbody>
                    @foreach ($users as $user)
                        <tr>
                            <td>{{ $user->id }}</td>
                            <td>{{ $user->name }}</td>
                            <td>{{ $user->email }}</td>
                            <td>{{ $user->address }}</td>
                            <td>
                                <a href="{{ route('users.edit', $user->id) }}" class="btn btn-warning">Edit</a>
                                <form id="deleteForm{{ $user->id }}" action="{{ route('users.destroy', ['id' => $user->id]) }} " method="POST">
                                    @method('DELETE')
                                    @csrf
                                </form>
                                <button data-form="deleteForm{{ $user->id }}" class="btn btn-delete btn-danger">Delete</button>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>

            <div>
                {{ $users->links() }}
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
           $(function(){
                $(document).on('click', '.btn-delete', function(){
                    let formId = $(this).data('form')

                    Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                    'Deleted!',
                    'Your file has been deleted.',
                    'success'
                    )
                    $(`#${formId}`).submit();
                }
                })
                    // if(confirm('Do you want to delete it?'))
                    // {
                    //     $(`#${formId}`).submit();
                    // }
                })
           })
    </script>
@endsection
