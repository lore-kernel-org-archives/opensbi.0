From: Anup Patel <Anup.Patel@wdc.com>
Date: Sat, 27 Nov 2021 04:20:46 +0000
Subject: [PATCH] reproducible builds: strip embedded file paths
In-Reply-To: <877dcuweqs.fsf@ponder>
References: <874k89kl8o.fsf@ponder>
 <8607f8cc66989b754056f4396c16178bdc23c48a.camel@126.com>
 <875ysl2u59.fsf@ponder>
 <be5f7d5821b498554ce426153b98e7077881a5ec.camel@126.com>
 <87mtlwsuvh.fsf@ponder>
 <CAAhSdy0vAGNZKV76aosJh84vpVn8hQ4EbfGEeYSn1YzUN4+AHg@mail.gmail.com>
 <25ea5b58027e51df4f1399f667d14606b7a4f7b4.camel@126.com>
 <877dcuweqs.fsf@ponder>
Message-ID: <3D55B2FB-73EA-4A36-AD3C-5698FD164892@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



?On 27/11/21, 8:24 AM, "opensbi on behalf of Vagrant Cascadian" <opensbi-bounces at lists.infradead.org on behalf of vagrant@reproducible-builds.org> wrote:

    On 2021-11-22, Xiang W. wrote:
    > ? 2021-11-22???? 10:13 +0530?Anup Patel???
    >> On Mon, Nov 22, 2021 at 10:02 AM Vagrant Cascadian
    >> <vagrant@reproducible-builds.org> wrote:
    >> > 
    >> > On 2021-11-22, Xiang W. wrote:
    >> > > ? 2021-11-21???? 11:20 -0800?Vagrant Cascadian???
    >> > > > of the directories below, I built using the same toolchain from
    >> > > > the same git commit...
    >> > > > 
    >> > > > $ cd /home/vagrant/src/opensbi/opensbi1
    >> > > > $ CROSS_COMPILE=riscv64-linux-gnu- make V=1 FW_PAYLOAD=n
    >> > > > PLATFORM=generic
    >> > > > ...
    >> > > > $ strings build/platform/generic/firmware/fw_dynamic.bin | grep
    >> > > > /home/vagrant
    >> > > > /home/vagrant/src/opensbi/opensbi1/lib/sbi/riscv_asm.c
    >> > ...
    >> > > This is because the source file uses the absolute path when
    >> > > compiling,
    >> > > you can use the relative path by modifying the Makefile
    >> > > 
    >> > > diff --git a/Makefile b/Makefile
    >> > > index 8623c1c..d017534 100644
    >> > > --- a/Makefile
    >> > > +++ b/Makefile
    >> > > @@ -361,7 +361,7 @@ compile_cc_dep = $(CMD_PREFIX)mkdir -p
    >> > > `dirname
    >> > > $(1)`; \
    >> > >              -MM $(2) >> $(1) || rm -f $(1)
    >> > >  compile_cc = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
    >> > >            echo " CC        $(subst $(build_dir)/,,$(1))"; \
    >> > > -          $(CC) $(CFLAGS) $(call dynamic_flags,$(1),$(2)) -c
    >> > > $(2) -
    >> > > o $(1)
    >> > > +          $(CC) $(CFLAGS) $(call dynamic_flags,$(1),$(2)) -c
    >> > > $(subst $(src_dir)/,,$(2)) -o $(1)
    >> > >  compile_as_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
    >> > >            echo " AS-DEP    $(subst $(build_dir)/,,$(1))"; \
    >> > >            printf %s `dirname $(1)`/ > $(1) && \
    >> > 
    >> > That solves the issue and is probably better than passing more
    >> > compiler
    >> > arguments, thanks!
    >> 
    >> This will only work if we are compiling from the OpenSBI source
    >> directory
    >> itself. What if users compile OpenSBI with a different current
    >> directory
    >> using "make -C <opensbi_source_path>". I guess passing compiler
    >> argument will allow "make -C <opensbi_source_path>".
    >
    > make -C <directory> will switch the path to <directory> first, so the
    > result is the same.

    Any outstanding concerns with proposing the patch by Xiang W to pass
    relative directories instead of the original patch I submitted?

    Should it be submitted by Xiang W or should I merge the commit message
    from the original patch and submit it myself?

[Anup] Change the patch subject to "Makefile: strip embedded file paths"
and send v2 patch.
[Anup] Please use "git send-email" to send patch to opensbi mailing list.
You will have to join the mailing list before posting because it allows
posting by mailing list members only.

Regards,
Anup

    Thanks!


    live well,
      vagrant

