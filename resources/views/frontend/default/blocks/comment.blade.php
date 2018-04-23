<div class="comment-wrapper mt-40 mb-40">
    @if( count($comments) > 0 )
    <h3>{{ __('site.comment').' ('.count($comments).')' }}</h3>
    <ul class="comment-list">
        @forelse($comments as $comment)
        <li>
            <div class="single-comment fix">
                <div class="image float-left"><img src="{{ asset('noimage/50x50') }}" alt="" class="img-circle"></div>
                <div class="content fix">
                    <div class="head fix">
                        <div class="author-time">
                            <h4>{{ $comment->name }}</h4>
                            <span>{{ nice_time($comment->created_at) }}</span>
                        </div>
                        <a href="#">Replay</a>
                    </div>
                    <p>{!! $comment->description !!}</p>
                </div>
            </div>
        </li>
        @empty
        @endforelse
    </ul>
    @endif
    <h3>{{ __('site.leave_a_comment') }}</h3>
    <div class="comment-form">
        <form action="{{ URL::current() }}" method="post">
            @if( @$product->id )
            <input type="hidden" name="product_id" value="{{ $product->id }}">
            @elseif( @$post->id )
            <input type="hidden" name="post_id" value="{{ $post->id }}">
            @endif
            <div class="row">
	            <div class="col-sm-4 col-xs-12">
	                <label for="name">{{ __('site.name') }}</label>
	                <input name="name" type="text">
	            </div>
	            <div class="col-sm-8 col-xs-12">
	                <label for="email">Email</label>
	                <input name="email" type="text">
	            </div>
	            <div class="col-xs-12">
					<label for="contents">{{ __('site.content') }}</label>
					<textarea name="contents"></textarea>
				</div>
	            <div class="col-xs-12">
	                <button type="submit" class="btn btn-primary btn-ajax" data-ajax="act=comment|type=default"> {{ __('site.send_comment') }} </button>
				</div>
			</div>
		</form>
    </div>
</div>