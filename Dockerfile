FROM alpine

COPY spam.sh /

ENTRYPOINT [ "/spam.sh" ]
