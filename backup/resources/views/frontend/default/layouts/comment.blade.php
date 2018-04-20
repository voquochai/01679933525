<div class="comment-wrapper mt-40 mb-40">
    @if( count($comments) > 0 )
    <h3>Comments ({{ count($comments) }})</h3>
    <ul class="comment-list">
        @forelse($comments as $comment)
        <li>
            <div class="single-comment fix">
                <div class="image float-left"><img src="img/blog/comment-1.jpg" alt=""></div>
                <div class="content fix">
                    <div class="head fix">
                        <div class="author-time">
                            <h4>{{ $comment->name }}</h4>
                            <span>09 hours ago</span>
                        </div>
                        <a href="#">Replay</a>
                    </div>
                    <p>{!! $comment->contents !!}</p>
                </div>
            </div>
        </li>
        @empty
        @endforelse
    </ul>
    @endif
    <h3>Leave A Comment</h3>
    <div class="comment-form row">
        <form action="{{ URL::current() }}" method="post">
            @if( @$product->id )
            <input type="hidden" name="product_id" value="{{ $product->id }}">
            @elseif( @$post->id )
            <input type="hidden" name="post_id" value="{{ $post->id }}">
            @endif
            <div class="col-sm-4 col-xs-12">
                <label for="name">Họ và Tên</label>
                <input name="name" type="text">
            </div>
            <div class="col-sm-8 col-xs-12">
                <label for="email">Email</label>
                <input name="email" type="text">
            </div>
            <div class="col-xs-12">
				<label for="contents">Nội dung</label>
				<textarea name="contents"></textarea>
			</div>
            <div class="col-xs-12">
                <button type="submit" class="btn btn-primary btn-ajax" data-ajax="act=comment|type=default"> Đăng ký </button>
			</div>
		</form>
    </div>
</div>