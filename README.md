# iptv-analyzer
It is dockerezied IPTV-analyzer from https://github.com/netoptimizer/IPTV-Analyzer

It`s based on Ubuntu 14.04 and need to be run with PRIV flags: 

docker run -D --net=host --cap-add=NET_ADMIN --privileged -p80:80 CrezZ/iptv-analyzer

Than we can use http://youip:80 to manage Analyzer via web-interface
