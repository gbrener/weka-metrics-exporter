FROM alpine:latest

RUN apk add --no-cache bash curl python3 py3-pip

RUN pip3 install prometheus_client pyyaml
  
COPY weka-metrics-exporter.py /root/
COPY weka-metrics-exporter.yml /root/
COPY start_exporter.sh /root/

RUN chmod +x /root/start_exporter.sh /root/weka-metrics-exporter.py

ENTRYPOINT ["/root/start_exporter.sh"]
