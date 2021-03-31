From: chenguokai17@mails.ucas.ac.cn <chenguokai17@mails.ucas.ac.cn>
Date: Wed, 31 Mar 2021 22:39:11 +0800
Subject: Floating point emulation support policy
Message-ID: <03271F5A-1F75-48B0-8DA7-3926225227F8@mails.ucas.ac.cn>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

?

> ? 2021?3?31????1:05?Anup Patel <Anup.Patel@wdc.com> ???
> 
> ?
> 
>> -----Original Message-----
>> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Xim
>> Sent: 30 March 2021 08:14
>> To: opensbi at lists.infradead.org
>> Subject: Floating point emulation support policy
>> Hi all,
>> My institution wants to run GNU/Linux distributions on a RISC-V core without
>> hardware floating point support. We used Berkeley Boot Loader (BBL) before
>> which has a built-in support for soft floating point emulation. We are
>> swtching to OpenSBI but no such emulations seem to exist in OpenSBI for
>> now. I wonder if OpenSBI would be happy to accept a port of such functions.
> 
> The suggestion of adding floating point emulation in OpenSBI has been
> proposed to us quite a few times in past.
> 
> Instead of adding floating point emulation in OpenSBI, another option is
> to disable FP for Linux RISC-V kernel and compiler user-space using soft-float
> toolchain. This approach will perform much better as compared to OpenSBI
> trapping and emulating floating point instructions.
> 
> Regards,
> Anup

Got it, but still wonder if you plan to support running GNU/Linux distributions which by default compile all their (user-space) packages with RV64GC on hardwares with no FPU. It is not so realistic to recompile them with a soft-float toolchain.

Regards,
Guokai Chen

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: Message signed with OpenPGP
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20210331/a562fcb3/attachment.sig>
