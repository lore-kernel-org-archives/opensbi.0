From: Michael Neuling <MichaelNeuling@tenstorrent.com>
Date: Thu, 12 Dec 2024 15:36:28 +1100
Subject: [PATCH 1/2] lib: utils/serial: Cleanup int vs bool in
 semihosting_init() definitions
In-Reply-To: <cad597ce46ce89e599689966f7a2f5ec35366774.camel@126.com>
References: <20241204055452.652401-1-michaelneuling@tenstorrent.com> <cad597ce46ce89e599689966f7a2f5ec35366774.camel@126.com>
Message-ID: <CAAQMj+osGqYQn-_TEpyD3i_Cv7tH=NuVhs00gAJJQB+XkF2nYg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> > -static inline int semihosting_init(void) { return SBI_ENODEV; }
> > -static inline int semihosting_enabled(void) { return 0; }
> > +static inline bool semihosting_init(void) { return SBI_ENODEV; }
> > +static inline bool semihosting_enabled(void) { return 0; }
> The bool type should return true or false.

Nice catch. I'll resend.

Mikey

