@extends('layouts.app')

@section('content')
<div class="card-body">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3">
        <h1 class="h2">
            Members
        </h1>

        <div class="btn-toolbar mb-2 mb-md-0">
            <div class="btn-group">

            </div>
        </div>
    </div>    

    <div class="table-responsive">
        @if($members->isEmpty())
            <p class="lead text-muted">
                No data to display at the moment.
            </p>
        @else
            <table class="table table-striped table-sm">
                <thead>
                    <tr>
                        <th>Thumbnail</th>

                        <th>Name</th>

                        <th>Gender</th>

                        <th>Platform</th>
                        
                        <th class="text-center">Actions</th>
                    </tr>
                </thead>

                <tbody>
                    @foreach($members as $member)
                        <tr>
                            <td class="align-middle">
                                <img
                                    src="{{ $member->avatar ? $member->avatar : '/img/logo.png' }}"
                                    height="50"
                                    alt="{{ $member->name }}"
                                >
                            </td>

                            <td class="align-middle">
                                {{ $member->name }}
                            </td>

                            <td class="align-middle text-capitalize">
                                @if(is_null($member->gender))
                                    Unknown
                                @else
                                    {{ $member->gender }}
                                @endif
                            </td>

                            <td class="align-middle text-capitalize">
                                {{ $member->platform->name }}
                            </td>
                            
                            <td class="text-center align-middle">
                                <form action="#" method="POST">
                                    {{ csrf_field() }}
                                    {{ method_field('PATCH')}}

                                    <div class="btn-group">
                                        <button type="submit" class="btn btn-sm btn-outline-secondary">Unsubscribe</button>
                                    </div>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>

            {{ $members->links() }}
        @endif
    </div>
</div>
@endsection