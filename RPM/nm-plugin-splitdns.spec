#
# spec file for package 
#
# Copyright (c) specCURRENT_YEAR SUSE LINUX Products GmbH, Nuernberg, Germany.
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# Please submit bugfixes or comments via http://bugs.opensuse.org/
#

Name:           nm-plugin-splitdns
Version:	0.3
Release:	3
License:	GPL-3.0
Summary:	NetworkManager Siproxd & DNSMasq Plugin
Url:		  https://github.com/M0ses/nm-plugin-sad
Group:		Productivity/Networking/System
Source:		%name-%version.tar.gz 
PreReq:		NetworkManager

Requires: dnsmasq

BuildRoot:      %{_tmppath}/%{name}-%{version}-build
BuildArch:      noarch


%description
This packages provides a plugin in form of a dispatcher script for 
NetworkManager which starts dnsmasq if a specific VPN Connection is 
started

%prep
%setup -q -n %{name}-%{version}

%build

%install
export DESTDIR=$RPM_BUILD_ROOT
%make_install

%post

%postun

%files
%defattr(-,root,root)
%dir /opt/%{name}/
%dir /opt/%{name}/etc
%dir /opt/%{name}/tmp
%dir /opt/%{name}/bin
%dir /opt/%{name}/templates
/opt/%{name}/bin/vpn_splitdns
/etc/NetworkManager/dispatcher.d/zzz_vpn_splitdns
%config (noreplace) /opt/%{name}/etc/vpn_splitdns.cnf
%doc README.md

%changelog
* Sat Oct 17 2015 m0ses@samaxi.de
- initial version


