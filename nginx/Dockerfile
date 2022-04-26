FROM --platform=linux/x86_64 nginx:1.21.1

# /etc/ngins/nginx.confからincludeされているディレクトリ内を削除
RUN rm -f /etc/nginx/conf.d/*

# Nginx設定ファイルコピー
ADD nginx.conf /etc/nginx/conf.d/tmp_rails.conf

# ビルド完了後にNginx起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf


