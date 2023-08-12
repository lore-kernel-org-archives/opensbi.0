From: 刘海蛟 <liuhaijiao666@gmail.com>
Date: Sat, 12 Aug 2023 12:49:45 +0800
Subject: [PATCH] fix T-HEAD c9xx cpu softlock
Message-ID: <CAFQvXH8tKrT2tgZm7Q8b4k2MpP8Bazd9zkE8KOmEC8r+MGtQgw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These patches fix the system hang issue caused by using perf tool on
T-HEAD c9xx related platforms.

When detecting features of PMU, MHPMCOUNTER3 is changed to 0xffffffffffffffff
in the function hart_mhpm_get_allowed_bits. Enabling the counter directly would
cause an overflow interrupt. The correct procedure is to initialize
the counter's initial
value before enabling the counter to count.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0000-cover-letter.patch
Type: application/octet-stream
Size: 569 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20230812/8363c06c/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-lib-sbi_pmu-ensure-update-hpm-counter-before-startin.patch
Type: application/octet-stream
Size: 1619 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20230812/8363c06c/attachment-0001.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-platform-generic-allwinner-fix-OV-process-for-T-HEAD.patch
Type: application/octet-stream
Size: 2059 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20230812/8363c06c/attachment-0002.obj>
