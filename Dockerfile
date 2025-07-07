FROM quay.io/fedora/fedora-bootc@sha256:04aabf85c630ec8ce2c2cc24ecd4e21154136364d931a302cf7b9fc943e4fe94

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
