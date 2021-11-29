From: Vagrant Cascadian <vagrant@reproducible-builds.org>
Date: Mon, 29 Nov 2021 10:13:25 -0800
Subject: [PATCH v2] Makefile: Pass relative paths to the compiler.
In-Reply-To: <87a6hnp7vv.fsf@igel.home>
References: <20211129015502.4767-1-vagrant@reproducible-builds.org>
 <87a6hnp7vv.fsf@igel.home>
Message-ID: <87tufu3k56.fsf@ponder>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2021-11-29, Andreas Schwab wrote:
> On Nov 28 2021, Vagrant Cascadian wrote:
>
>> diff --git a/Makefile b/Makefile
>> index 8623c1c..d017534 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -361,7 +361,7 @@ compile_cc_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
>>  	       -MM $(2) >> $(1) || rm -f $(1)
>>  compile_cc = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
>>  	     echo " CC        $(subst $(build_dir)/,,$(1))"; \
>> -	     $(CC) $(CFLAGS) $(call dynamic_flags,$(1),$(2)) -c $(2) -o $(1)
>> +	     $(CC) $(CFLAGS) $(call dynamic_flags,$(1),$(2)) -c $(subst $(src_dir)/,,$(2)) -o $(1)
>
> How about making src_dir empty throughout?  This now depends on
> $(src_dir) being identical to ".", so making that explicit would be
> better.

Is this more-or-less what you were suggesting?

diff --git a/Makefile b/Makefile
index 8623c1c..cd4be3c 100644
--- a/Makefile
+++ b/Makefile
@@ -20,7 +20,7 @@ READLINK ?= readlink
 endif
 
 # Find out source, build, and install directories
-src_dir=$(CURDIR)
+src_dir=.
 ifdef O
  build_dir=$(shell $(READLINK) -f $(O))
 else


It builds fine (haven't boot tested), and doesn't embed the build path
in the binaries.


live well,
  vagrant
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 227 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20211129/56b04f77/attachment-0001.sig>
