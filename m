From: Xim <chenguokai17@mails.ucas.ac.cn>
Date: Tue, 30 Mar 2021 10:44:04 +0800
Subject: Floating point emulation support policy
Message-ID: <EB123894-29D2-4EC4-88FA-D6CB975B0C98@mails.ucas.ac.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

My institution wants to run GNU/Linux distributions on a RISC-V core without hardware floating point support. We used Berkeley Boot Loader (BBL) before which has a built-in support for soft floating point emulation. We are swtching to OpenSBI but no such emulations seem to exist in OpenSBI for now. I wonder if OpenSBI would be happy to accept a port of such functions.

Regards,
Guokai Chen
chenguokai17 at mails.ucas.ac.cn






-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: Message signed with OpenPGP
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20210330/67bf6e40/attachment.sig>
