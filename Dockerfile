FROM quay.io/fedora/fedora-bootc@sha256:824ffaae496bc19ad39ab94ff4545e789dc4fc862e30f87036b5b0f2e0cc54ca

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
