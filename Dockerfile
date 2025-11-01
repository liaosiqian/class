FROM nginx:alpine

# 复制HTML文件到nginx默认目录
COPY class.html /usr/share/nginx/html/index.html

# 复制nginx配置（如果需要自定义）
# COPY nginx.conf /etc/nginx/nginx.conf

# 暴露端口
EXPOSE 80

# 启动nginx
CMD ["nginx", "-g", "daemon off;"]

