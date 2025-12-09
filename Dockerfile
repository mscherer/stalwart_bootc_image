FROM quay.io/fedora/fedora-bootc@sha256:49415a5a0bb48f858e22884b16e79c6b93a4ee8ff644c41a8d52b786f9aa0299

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
