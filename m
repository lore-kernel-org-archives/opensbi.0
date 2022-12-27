From: Samuel Holland <samuel@sholland.org>
Date: Tue, 27 Dec 2022 13:12:05 -0600
Subject: [PATCH 1/1] platform: generic: allwinner: avoid buffer overrun
In-Reply-To: <87r0wkd6hl.fsf@igel.home>
References: <20221227110129.145976-1-heinrich.schuchardt@canonical.com>
 <CAEUhbmX9u1Fpy-ZQP=Gyp=-jwc5OzRM7XziCkydLcsQqYBivKg@mail.gmail.com>
 <374eb91d-e580-3583-accf-0d0e3a3687ea@canonical.com>
 <CAEUhbmUbaAYp-dcEYF845XX66ZGFLPkNuJMp2xpkpPLNZ3o4MQ@mail.gmail.com>
 <87cz85dmmd.fsf@igel.home>
 <CAEUhbmXcQiGH6WQ3pN_C+mv_qRn0mF2Pb2vq_dxeXxMsygNwdw@mail.gmail.com>
 <da726834-79af-8e40-c39e-a6dd4c421ea4@sholland.org>
 <87v8lwd736.fsf@igel.home>
 <af4ef9bb-8c83-6c73-6e68-8c46b3b96892@sholland.org>
 <87r0wkd6hl.fsf@igel.home>
Message-ID: <6e6e3302-ce90-f851-807f-d236499dbf83@sholland.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/27/22 12:52, Andreas Schwab wrote:
> On Dez 27 2022, Samuel Holland wrote:
> 
>> I am aware. However, this sort of change is not feasible for
>> plic_context_save()/plic_context_restore(). It would severely complicate
>> those functions with extra bit manipulation (thus wasting even more
>> space in code size).
> 
> If your compiler is so dumb you have a much bigger problem.

I'm disappointed that I even have to explain this...

"This sort of change" to avoid using space for IRQ 0, thus saving one
*bit* in the array used by plic_context_save(), would require combining
two registers into one array element with shifts:

	enable[i] = plic_get_ie(plic, context_id, i) >> 1 |
	            plic_get_ie(plic, context_id, i + 1) << 31;

and doing the opposite transformation in plic_context_restore(). The
compiler is not going to optimize that out.

If you really care about shaving off bytes, there is plenty of
low-hanging fruit elsewhere in OpenSBI. This bikeshed really does not
need painting.

Regards,
Samuel


