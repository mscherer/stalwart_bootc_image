FROM quay.io/fedora/fedora-bootc@sha256:3a163c8ecd865539769d6c784a9dc482350a2397f47a26bab5f2cedbc4afb0b4

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
