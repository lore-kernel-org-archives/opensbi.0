From: Anup Patel <anup@brainfault.org>
Date: Tue, 4 Apr 2023 14:59:02 +0530
Subject: using kconfiglib from scripts
In-Reply-To: <4d5d1afe-b271-1053-5584-d4517c4f4179@codethink.co.uk>
References: <4d5d1afe-b271-1053-5584-d4517c4f4179@codethink.co.uk>
Message-ID: <CAAhSdy3DT8mqR7fJi7WDaJELCf9WVKHW+9S5HBv6eybPqVQ=-g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 4, 2023 at 2:13?PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> Hi, is there any documentation about doing updates for .config
> from scripts using the scripts/Kconfiglib scripts?
>
> I'm looking at updating our CI and need to set a couple of .config
> options over the generic build.

You can add custom xyz_defconfig under platform/generic/configs and
compile OpenSBI as follows:
# make PLATFORM=generic PLATFORM_DEFCONFIG=xyz_defconfig

Regards,
Anup

>
> --
> Ben Dooks                               http://www.codethink.co.uk/
> Senior Engineer                         Codethink - Providing Genius
>
> https://www.codethink.co.uk/privacy.html
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

