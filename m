From: Darius Rad <darius@bluespec.com>
Date: Mon, 6 Jun 2022 06:50:02 -0400
Subject: [RISC-V] [tech-unixplatformspec] SBI Debug Console Extension
 Proposal (Draft v1)
In-Reply-To: <CAK9=C2UpWA1x6DT8jo8hxvsnPJVLPAUMDTzhY5bYayAENVHdDg@mail.gmail.com>
References: <CAK9=C2UpWA1x6DT8jo8hxvsnPJVLPAUMDTzhY5bYayAENVHdDg@mail.gmail.com>
Message-ID: <Yp3b2pjG/CgLV2Za@bruce.bluespec.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 01, 2022 at 09:47:32PM +0530, Anup Patel wrote:
> 
> Debug Console Extension (EID #0x4442434E "DBCN")
> ================================================
> 
> The debug console extension defines a generic mechanism for boot-time
> early prints from supervisor-mode software which allows users to catch
> boot-time issues in supervisor-mode software.
> 
> This extension replaces legacy console putchar (EID #0x01) extension
> and it is better in following ways:
> 1) It follows the new calling convention defined for SBI v1.0
>    (or higher).
> 2) It is based on a shared memory area between SBI implementation
>    and supervisor-mode software so multiple characters can be
>    printed using a single SBI call.
> 
> The supervisor-mode software must set the shared memory area before
> printing characters on the debug console. Also, all HARTs share the
> same shared memory area so only one HART needs to set it at boot-time.
> 

It seems to me that the rationale and summary of the extension is
insufficient, and non-normative commentary is lacking.  The ensuing mailing
list discussion suggests that there are additional requirements and
assumptions that influenced the design of the interface, but are not
mentioned here.  It is important to document such information, in order to
have a constructive discussion now, and also to preserve such information
for readers in the future who may not have the benefit of reading the
mailing list discussions.

// darius


