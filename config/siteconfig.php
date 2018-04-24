<?php

return [
	'general' => [
		'language' => 'vi',
		'google_coordinates' => '10.8537862, 106.62834440000006',
	],
	'languages' => [
		'vi' => 'Tiếng Việt',
		'en' => 'Tiếng Anh'
	],
	'social' => [
		'vi' => 'vi_VN',
		'en' => 'en_US'
	],
	'order_site_status' => [
		'1'	=>	'Đơn hàng mới',
		'2'	=>	'Đang giao hàng',
		'3'	=>	'Đã nhận tiền',
		'4'	=>	'Hủy đơn hàng',
	],
	'order' => [
		'online' 	=>	[
			'page-title'	=>	'Đơn hàng',
			'status'      => [
				'publish'     => 'Hiển thị'
			]
		],
		'default' 	=>	[
			'page-title'	=>	'Đơn hàng',
			'status'      => [
				'publish'     => 'Hiển thị'
			]
		],
	],
	'supplier' => [
		'default' 	=>	[
			'page-title'	=>	'Nhà cung cấp',
			'status'      => [
				'publish'     => 'Hiển thị'
			]
		],
	],
	'wms' => [
		'store'	=>	[
			'default' 	=>	[
				'page-title'	=>	'Kho hàng',
				'status'      => [
					'publish'     => 'Hiển thị'
				]
			],
		],
		'import'	=>	[
			'default' 	=>	[
				'page-title'	=>	'Nhập hàng',
				'status'      => [
					'publish'     => 'Hoàn thành',
					'cancel'     => 'Hủy phiếu',
				]
			],
		],
		'export'	=>	[
			'default' 	=>	[
				'page-title'	=>	'Xuất hàng',
				'status'      => [
					'publish'     => 'Hoàn thành',
					'cancel'     => 'Hủy phiếu',
				]
			],
		],
	],
	'category' => [
		'san-pham'	=>	[
			'page-title'	=>	'Danh mục',
			'level' =>	3,
			'icon'	=>	false,
			'description' =>	false,
			'contents'    =>	false,
			'image'       =>	false,
			'thumbs'	=>	[
				'_small' => [
					'width'  =>	300,
					'height' =>	200,
				],
			],
			'status' => [
				'publish' => 'Hiển thị',
			]
		],
		'tin-tuc'	=>	[
			'page-title'	=>	'Danh mục',
			'level' =>	1,
			'icon'	=>	false,
			'description' =>	false,
			'contents'    =>	false,
			'image'       =>	false,
			'thumbs'	=>	[
				'_small' => [
					'width'  =>	300,
					'height' =>	200,
				],
			],
			'status' => [
				'publish' => 'Hiển thị',
			]
		],
		'default'	=>	[
			'page-title'	=>	'Danh mục',
			'level' =>	1,
			'icon'	=>	false,
			'description' =>	false,
			'contents'    =>	false,
			'image'       =>	false,
			'thumbs'	=>	[
				'_small' => [
					'width'  =>	300,
					'height' =>	200,
				]
			],
			'status' => [
				'publish' => 'Hiển thị'
			]
		],
		'path'	=>	'uploads/categories'
	],
	'product' => [
		'san-pham' 	=>	[
			'page-title'	=>	'Sản phẩm',
			'category'    =>	true,
			'supplier'    =>	true,
			'description' =>	true,
			'contents'    =>	true,
			'link'    =>	true,
			'attributes'    =>	true,
			'image'       =>	true,
			'images'      =>	true,
			'thumbs'	=>	[
				'_small' => [
					'width'  =>	300,
					'height' =>	300,
				],'_medium' => [
					'width'  =>	600,
					'height' =>	600,
				],'_large' => [
					'width'  =>	1000,
					'height' =>	1000,
				],
			],
			'status'      => [
				'new'     => 'Mới',
				'publish'     => 'Hiển thị',
			],
			'product_colors'	=>	true,
			'product_sizes'	=>	true,
			'product_tags'	=>	true,
		],
		'default' 	=>	[
			'page-title'	=>	'Sản phẩm',
			'category'    =>	false,
			'supplier'    =>	false,
			'description' =>	false,
			'contents'    =>	false,
			'link'    =>	false,
			'attributes'    =>	false,
			'image'       =>	false,
			'images'      =>	false,
			'thumbs'	=>	[
				'_small' => [
					'width'  =>	300,
					'height' =>	200,
				]
			],
			'status'      => [
				'publish'     => 'Hiển thị'
			],
			'product_colors'	=>	false,
			'product_sizes'	=>	false,
			'product_tags'	=>	false,
		],
		'path'    =>	'uploads/products'
	],
	'post' => [
		'tin-tuc' 	=>	[
			'page-title'	=>	'Tin tức',
			'category'    =>	true,
			'description' =>	true,
			'contents'    =>	true,
			'link'    =>	true,
			'seo'	=>	true,
			'attributes'    =>	false,
			'image'       =>	true,
			'images'      =>	true,
			'thumbs'	=>	[
				'_small' => [
					'width'  =>	330,
					'height' =>	220,
				],
			],
			'status'      => [
				'new'     => 'Mới',
				'publish'     => 'Hiển thị',
			],
			'post_tags'	=>	true,
		],
		'dich-vu' 	=>	[
			'page-title'	=>	'Dịch vụ',
			'category'    =>	false,
			'description' =>	true,
			'contents'    =>	true,
			'link'    =>	true,
			'seo'	=>	true,
			'attributes'    =>	false,
			'image'       =>	true,
			'images'      =>	true,
			'thumbs'	=>	[
				'_small' => [
					'width'  =>	300,
					'height' =>	200,
				],
			],
			'status'      => [
				'new'     => 'Mới',
				'publish'     => 'Hiển thị',
			],
			'post_tags'	=>	true,
		],
		'khach-hang' 	=>	[
			'page-title'	=>	'Khách hàng',
			'category'    =>	false,
			'description' =>	true,
			'contents'    =>	false,
			'link'    =>	false,
			'seo'	=>	false,
			'attributes'    =>	false,
			'image'       =>	true,
			'images'      =>	false,
			'thumbs'	=>	[
				'_small' => [
					'width'  =>	200,
					'height' =>	200,
				]
			],
			'status'      => [
				'index'     => 'Trang chủ',
				'publish'     => 'Hiển thị'
			],
			'post_tags'	=>	false,
		],
		'payment' 	=>	[
			'page-title'	=>	'Hình thức thanh toán',
			'category'    =>	false,
			'description' =>	true,
			'contents'    =>	false,
			'link'    =>	false,
			'seo'	=>	false,
			'attributes'    =>	false,
			'image'       =>	false,
			'images'      =>	false,
			'thumbs'	=>	[
				'_small' => [
					'width'  =>	200,
					'height' =>	200,
				]
			],
			'status'      => [
				'publish'     => 'Hiển thị'
			],
			'post_tags'	=>	false,
		],
		'default' 	=>	[
			'page-title'	=>	'Bài viết',
			'category'    =>	false,
			'description' =>	false,
			'contents'    =>	false,
			'link'    =>	false,
			'seo'	=>	false,
			'attributes'    =>	false,
			'image'       =>	false,
			'images'      =>	false,
			'thumbs'	=>	[
				'_small' => [
					'width'  =>	300,
					'height' =>	200,
				]
			],
			'status'      => [
				'publish'     => 'Hiển thị'
			],
			'post_tags'	=>	false,
		],
		'path'    =>	'uploads/posts'
	],
	'attribute' => [
		'product_colors' 	=>	[
			'page-title'	=>	'Màu sắc',
			'status'      => [
				'publish'     => 'Hiển thị',
			]
		],
		'product_sizes' 	=>	[
			'page-title'	=>	'Kích cỡ',
			'status'      => [
				'publish'     => 'Hiển thị',
			]
		],
		'product_tags' 	=>	[
			'page-title'	=>	'Thẻ',
			'status'      => [
				'publish'     => 'Hiển thị',
			]
		],
		'post_tags' 	=>	[
			'page-title'	=>	'Thẻ',
			'status'      => [
				'publish'     => 'Hiển thị',
			]
		],
		'default' 	=>	[
			'page-title'	=>	'Thuộc tính',
			'status'      => [
				'publish'     => 'Hiển thị'
			]
		]
	],
	'page' => [
        'index' 	=>	[
            'page-title'	=>	'Trang chủ',
            'description' =>	false,
            'contents'    =>	false,
            'link'    =>	false,
            'seo'	=>	true,
            'image'       =>	false,
            'thumbs'	=>	[
                '_small' => [
                    'width'  =>	300,
                    'height' =>	200,
                ],
            ],
            'status'      => [
                'publish'     => 'Hiển thị',
            ]
        ],
		'gioi-thieu' 	=>	[
			'page-title'	=>	'Giới thiệu',
			'description' =>	false,
			'contents'    =>	true,
			'link'    =>	false,
			'seo'	=>	true,
			'image'       =>	false,
			'thumbs'	=>	[
				'_small' => [
					'width'  =>	300,
					'height' =>	200,
				],
			],
			'status'      => [
				'publish'     => 'Hiển thị',
			]
		],
        'tuyen-dung' 	=>	[
            'page-title'	=>	'Tuyển dụng',
            'description' =>	false,
            'contents'    =>	true,
            'link'    =>	false,
            'seo'	=>	true,
            'image'       =>	false,
            'thumbs'	=>	[
                '_small' => [
                    'width'  =>	300,
                    'height' =>	200,
                ],
            ],
            'status'      => [
                'publish'     => 'Hiển thị',
            ]
        ],
        'lien-he' 	=>	[
            'page-title'	=>	'Liên hệ',
            'description' =>	false,
            'contents'    =>	true,
            'link'    =>	false,
            'seo'	=>	true,
            'image'       =>	false,
            'thumbs'	=>	[
                '_small' => [
                    'width'  =>	300,
                    'height' =>	200,
                ],
            ],
            'status'      => [
                'publish'     => 'Hiển thị',
            ]
        ],
        'footer' 	=>	[
            'page-title'	=>	'Footer',
            'description' =>	false,
            'contents'    =>	true,
            'link'    =>	false,
            'seo'	=>	false,
            'image'       =>	false,
            'thumbs'	=>	[
                '_small' => [
                    'width'  =>	300,
                    'height' =>	200,
                ],
            ],
            'status'      => [
                'publish'     => 'Hiển thị',
            ]
        ],
		'default' 	=>	[
			'page-title'	=>	'Trang tĩnh',
			'description' =>	false,
			'contents'    =>	false,
			'link'    =>	false,
			'seo'	=>	false,
			'image'       =>	false,
			'thumbs'	=>	[
				'_small' => [
					'width'  =>	300,
					'height' =>	200,
				]
			],
			'status'      => [
				'publish'     => 'Hiển thị'
			]
		],
		'path'    =>	'uploads/pages'
	],
	'photo' => [
        'slideshow' 	=>	[
            'page-title'	=>	'Slideshow',
            'description' =>	true,
            'link'    =>	true,
            'image'       =>	true,
            'thumbs'	=>	[
                '_small' => [
                    'width'  =>	1920,
                    'height' =>	900,
                ],
            ],
            'status'      => [
                'publish'     => 'Hiển thị',
            ]
        ],
        'banner' 	=>	[
            'page-title'	=>	'Banner',
            'description' =>	false,
            'link'    =>	true,
            'image'       =>	true,
            'thumbs'	=>	[
                '_small' => [
                    'width'  =>	570,
                    'height' =>	285,
                ],
            ],
            'status'      => [
                'publish'     => 'Hiển thị',
            ]
        ],
        'bank' 	=>	[
            'page-title'	=>	'Bank',
            'description' =>	false,
            'link'    =>	false,
            'image'       =>	true,
            'thumbs'	=>	[
                '_small' => [
                    'width'  =>	40,
                    'height' =>	24,
                ],
            ],
            'status'      => [
                'publish'     => 'Hiển thị',
            ]
        ],
		'default' 	=>	[
			'page-title'	=>	'Hình ảnh',
			'description' =>	false,
			'link'    =>	true,
			'image'       =>	true,
			'thumbs'	=>	[
				'_small' => [
					'width'  =>	300,
					'height' =>	200,
				]
			],
			'status'      => [
				'publish'     => 'Hiển thị'
			]
		],
		'path'    =>	'uploads/photos'
	],
	'link' => [
        'tieu-chi' 	=>	[
            'page-title'	=>	'Tiêu chí',
            'description' =>	true,
            'support' =>	false,
			'icon' =>	true,
			'youtube' =>	false,
            'link'    =>	false,
            'image'       =>	false,
            'thumbs'	=>	[
                '_small' => [
                    'width'  =>	300,
                    'height' =>	200,
                ],
            ],
            'status'      => [
                'publish'     => 'Hiển thị',
            ]
        ],
        'social' 	=>	[
            'page-title'	=>	'Mạng xã hội',
            'description' =>	false,
            'support' =>	false,
			'icon' =>	true,
			'youtube' =>	false,
            'link'    =>	true,
            'image'       =>	false,
            'thumbs'	=>	[
                '_small' => [
                    'width'  =>	300,
                    'height' =>	200,
                ],
            ],
            'status'      => [
                'publish'     => 'Hiển thị',
            ]
        ],
		'default' 	=>	[
			'page-title'	=>	'Liên kết',
			'description' =>	false,
			'support' =>	false,
			'icon' =>	false,
			'youtube' =>	false,
			'link'    =>	true,
			'image'       =>	true,
			'thumbs'	=>	[
				'_small' => [
					'width'  =>	300,
					'height' =>	200,
				]
			],
			'status'      => [
				'publish'     => 'Hiển thị'
			]
		],
		'path'    =>	'uploads/photos'
	],
	'register' => [
        'newsletter' 	=>	[
            'page-title'	=>	'Bản tin',
            'description' =>	false,
			'contents'    =>	false,
            'status'      => [
                'publish'     => 'Hiển thị',
            ]
        ],
        'contact' 	=>	[
            'page-title'	=>	'Liên hệ',
            'description' =>	true,
			'contents'    =>	false,
            'status'      => [
                'publish'     => 'Hiển thị',
            ]
        ],
		'default' 	=>	[
			'page-title'	=>	'Đăng ký',
			'description' =>	false,
			'contents'    =>	false,
			'status'      => [
				'publish'     => 'Hiển thị'
			]
		],
	],
	'comment' => [
		'default' 	=>	[
			'page-title'	=>	'Bình luận',
			'description' =>	true,
			'contents'    =>	false,
			'status'      => [
				'publish'     => 'Hiển thị'
			]
		],
	],
];