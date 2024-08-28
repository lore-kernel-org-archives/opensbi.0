From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Wed, 28 Aug 2024 16:01:06 +0100
Subject: [PATCH 2/2] Makefile: Remove -g from default CFLAGS
In-Reply-To: <CAEUhbmVB=qBxgYxTA9c4fZEXVTVNarJqqMjnHm_QFF_MGts3jA@mail.gmail.com>
References: <cover.1724487146.git.1952088712@qq.com>
 <tencent_07F41222A743779181827FB2F0EAE7BECE08@qq.com>
 <CAEUhbmVB=qBxgYxTA9c4fZEXVTVNarJqqMjnHm_QFF_MGts3jA@mail.gmail.com>
Message-ID: <46E64025-292E-41C9-A4CE-6971EE800948@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 28 Aug 2024, at 15:50, Bin Meng <bmeng.cn@gmail.com> wrote:
> 
> On Sat, Aug 24, 2024 at 4:22?PM Kele Zhang <1952088712@qq.com> wrote:
>> 
>> Remove `-g` from default CFLAGS as it should not be used in production
>> builds. Adjust optimization level to `-Og` when DEBUG is enabled.
> 
> The production build does not use ELF images to program onto the board
> but the plain binary image instead. So `-g`should be fine.

And even for boards that do, -g is the right thing to do. If you don?t
want debugging symbols, strip the binary, but it?s useful to default to
including them; distributions generally do exactly that, stripping the
installed binary but keeping the debug symbols around in a separate
.debug file.

Debug symbols also aren?t loaded into memory, they only exist on disk,
so the only cost is a bit of disk space.

Jess


