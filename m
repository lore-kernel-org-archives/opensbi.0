From: Sean Anderson <seanga2@gmail.com>
Date: Thu, 13 Aug 2020 14:53:36 -0400
Subject: [PATCH 1/1] lib: sbi: relax scoldboot_lock spinlock
In-Reply-To: <D8A34F50-F66A-4FA4-A869-FDBF015A9C46@jrtc27.com>
References: <20200813162415.124469-1-xypron.glpk@gmx.de>
 <B98172B0-5CAA-48D2-A2F3-B4DB6B66FB16@jrtc27.com>
 <e3f6b789-0fa6-51f1-4cc4-f5eaa625b8df@gmx.de>
 <B63355E7-4A46-4492-A97F-DE576FB0DDA0@jrtc27.com>
 <6d7b8314-499e-07ef-36e9-8a14e8461bba@gmx.de>
 <126C21E4-08E4-42BE-9BE2-FA2D1C2B4EB6@jrtc27.com>
 <40d31312-c0ae-cecf-e1a6-75e51cb0a1df@gmx.de>
 <904177D8-F733-4987-8CFD-37EC3DBC95C5@jrtc27.com>
 <D8A34F50-F66A-4FA4-A869-FDBF015A9C46@jrtc27.com>
Message-ID: <59b8e882-8536-adeb-c2ae-715099850106@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 8/13/20 2:44 PM, Jessica Clarke wrote:
> On 13 Aug 2020, at 19:37, Jessica Clarke <jrtc27@jrtc27.com> wrote:
>> On 13 Aug 2020, at 19:31, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>> Because there's global state to set up. You can't have all the other
>> harts rampaging through memory reading and writing whatever they like
>> until they can guarantee that the primary hart has performed all the
>> necessary initialisation for them to be able to roam free. I understand
>> you are trying to help and offer solutions, but it is getting rather
>> tedious to deal with what is now the third fundamentally broken patch
>> based on a lack of understanding, so please try to listen to us and
>> work with us to fix the problem you are facing rather than continuing
>> to play doctor and concoct your own broken "fixes".
> 
> Apologies, on closer inspection this does "fix" the problem as I had
> neglected the change to coldboot_lock's initialisation state. Yeah, it
> works, but, no, initialising a lock to be locked on boot is not good.
> All you've done is replace coldboot_done with !coldboot_lock (and made
> the latter play double-duty). This is hard to follow and just asking
> for mistakes to happen because it's not a normal thing to do.
> 
> Also, by doing this, you've now made all the harts busy-wait the entire
> time rather than be able to execute WFI until the primary hart is done,
> as they will be spinning for ages on the lock.

Why does this matter? This code will run for far less than a second,
once per boot. Any energy savings in OpenSBI will be trivial,
especially when compared to later boot stages.

--Sean

