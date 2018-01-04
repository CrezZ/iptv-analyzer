FROM ubuntu:14.04



RUN export DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y install xtables-addons-source autoconf ttf-freefont php-pear libproc-daemon-perl libproc-pid-file-perl libconfig-file-perl libdata-compare-perl liblog-log4perl-perl libnet-snmp-perl liblog-dispatch-perl
RUN sudo pear upgrade-all
RUN sudo pear install --alldeps Image_Color-alpha
RUN sudo pear install --alldeps Image_Canvas-alpha
RUN sudo pear install --alldeps Image_Graph-alpha
RUN sudo pear install --alldeps Log

RUN git clone https://github.com/netoptimizer/IPTV-Analyzer.git
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

RUN iptables -t mangle -I PREROUTING -i vlan446 -p udp -m mpeg2ts --name in_vlan446

RUN link /etc/apache2/conf-available/iptvprobe.conf /etc/apache2/conf-enabled/iptvprobe.conf

ENTRYPOINT [/usr/local/bin/iptv-collector]

