FROM quay.io/fedora/fedora-bootc@sha256:9ac597ccef7ba44ac92aefe39abee86b21d8674c23a4aaf6674525e57784a831

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
