FROM armhf/alpine
#RUN apk update
RUN apk --no-cache add --update curl raspberrypi
ADD temp.sh /app/temp.sh
ENTRYPOINT ["sh", "/app/temp.sh"]
