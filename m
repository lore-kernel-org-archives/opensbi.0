From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Oct 2021 13:26:00 +0200
Subject: [PATCH v6] Makefile: Add build time and compiler info string
In-Reply-To: <5121DC5F-ADCA-4A7F-9E0D-969BB87B98D6@jrtc27.com> (Jessica
 Clarke's message of "Wed, 20 Oct 2021 12:20:20 +0100")
References: <20211020094406.1393760-1-anup.patel@wdc.com>
 <87pms06jat.fsf@dell.be.48ers.dk>
 <5121DC5F-ADCA-4A7F-9E0D-969BB87B98D6@jrtc27.com>
Message-ID: <87lf2o6ipj.fsf@dell.be.48ers.dk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>>>>> "Jessica" == Jessica Clarke <jrtc27@jrtc27.com> writes:

Hi,

 >> What is this date -r fallback about? According to the spec,
 >> SOURCE_DATE_EPOCH is always a unix timestamp, never a filename:

 > GNU date and BSD date have a different but similar interface.

 > This is the sequence recommended by the Reproducible Builds project[1].

 > Jess

 > [1] https://reproducible-builds.org/docs/source-date-epoch/#makefile

Ahh, good to know - Thanks.

-- 
Bye, Peter Korsgaard

