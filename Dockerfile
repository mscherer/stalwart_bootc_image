FROM quay.io/fedora/fedora-bootc@sha256:bd463eec6fc3a39e69ed81dfc9761f1e9edb4deb2ecbe0919ab3f438e94d6abe

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
