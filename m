From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Thu, 30 Nov 2023 18:18:05 +0000
Subject: [RFC PATCH 0/2] Add support for Supervisor Software Events
 extension
In-Reply-To: <20231130091319.1223849-1-cleger@rivosinc.com>
References: <20231130091319.1223849-1-cleger@rivosinc.com>
Message-ID: <977FFDD0-F1AD-4E00-88BD-D9070ED8B1E9@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 30 Nov 2023, at 09:13, Cl?ment L?ger <cleger@rivosinc.com> wrote:
> 
> The SBI Supervisor Software Events (SSE) extensions provides a mechanism
> to inject software events from an SBI implementation to supervisor
> software such that it preempts all other supervisor level traps and
> interrupts [1].
> 
> Various events are defined and can be send asynchronously to supervisor
> software (RAS, PMU, DEBUG, Asynchronous page fault) from SBI as well
> as platform specific events. Events can be either local (per-hart) or
> global. Events can be nested on top of each other based on priority and
> can interrupt the supervisor mode at any time.
> 
> This PR adds support for this extension. First commit modifies interrupts
> handling to pass the sbi traps regs through interrupt handlers in order to inject
> SSE events from this context. Second one add the SSE support itself.
> 
> A RFC for Linux which uses this extension is available at [2].
> 
> Link: https://lists.riscv.org/g/tech-prs/message/515 [

This is the proposal from many months ago which I objected to. Have
there been any changes to the spec to not tie the SBI?s binary
interface too closely to the ISA and preclude the existence of
extensions that introduce new state SSE would need to save and restore?
I was under the impression from your talk a few weeks ago at LPC, which
even mentioned my comments explicitly, that was being worked on, yet
here we are with a new patch that doesn?t change the spec one bit.

Jess


