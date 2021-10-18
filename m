From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Oct 2021 08:18:09 +0200
Subject: [PATCH v5] Makefile: Add build time and compiler info string
In-Reply-To: <CAEUhbmWt9sPua3iQhJxBR0UzDPGDyHJK7BOZv15g5qT5+Z6OXQ@mail.gmail.com>
 (Bin Meng's message of "Mon, 18 Oct 2021 13:57:33 +0800")
References: <20211018041148.1343731-1-anup.patel@wdc.com>
 <CAEUhbmWt9sPua3iQhJxBR0UzDPGDyHJK7BOZv15g5qT5+Z6OXQ@mail.gmail.com>
Message-ID: <87y26qetzy.fsf@dell.be.48ers.dk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>>>>> "Bin" == Bin Meng <bmeng.cn@gmail.com> writes:

 > Hi Anup,
 > On Mon, Oct 18, 2021 at 12:13 PM Anup Patel <anup.patel@wdc.com> wrote:
 >> 
 >> From: Wei Fu <wefu@redhat.com>
 >> 
 >> When we are doing opensbi development, we want to know the build time and
 >> compiler info for debug purpose.
 >> To enable this message, please add "BUILD_INFO=y", like:
 >> 
 >> ```
 >> make BUILD_INFO=y
 >> ```
 >> 
 >> NOTE: `BUILD_INFO=y` will violate "reproducible builds".
 >> So it's ONLY for development and debug purpose, and should NOT be used
 >> in a product which follows "reproducible builds".

 > As I pointed out in v4, with BUILD_INFO=y we can still achieve
 > reproducible builds with BUILD_DATE_EPOCH, so this statement is not
 > entirely true.

 > The question is whether we should just drop introducing BUILD_INFO and
 > turn this on for all builds. If reproducible builds is required,
 > define BUILD_DATE_EPOCH.

Agreed, though BUILD_DATE_EPOCH seems to be specific to opensbi. Why was
this changed from SOURCE_DATE_EPOCH? In Buildroot at least, we only set
SOURCE_DATE_EPOCH when we want reproducible builds and the spec has
explicit examples where it is used for the build timestamp:

https://reproducible-builds.org/docs/source-date-epoch/

-- 
Bye, Peter Korsgaard

