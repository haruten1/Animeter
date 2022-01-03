module ApplicationHelper
        def default_meta_tags
          {
            title: 'Animeter',
            reverse: true,
            separator: '|',
            description: 'あなたの好きなアプリを登録し、友達と共通して好きなアニメを探せるWebアプリ',
            keywords: 'Animeter',
            canonical: request.original_url,
            noindex: ! Rails.env.production?,
            og: {
              site_name: 'Animeter',
              title: 'Animeter あなたの好きなアニメを登録しよう！',
              description: 'あなたの好きなアプリを登録し、友達と共通して好きなアニメを探せるWebアプリ', 
              type: 'website',
              url: request.original_url,
              image: image_url('animeter-neon.jpg'),
              locale: 'ja_JP',
            },
            twitter: {
              card: 'summary_large_image',
              site: '@haruten3200m',
            }
          }
        end
end
