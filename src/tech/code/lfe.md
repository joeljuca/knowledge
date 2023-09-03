# lfe ⛾

LFE (Lisp Flavoured Erlang; [website](https://lfe.io/), [Wikipedia](<https://en.wikipedia.org/wiki/LFE_(programming_language)>)) is a Lisp dialect built on Erlang/BEAM.

## oubiwann on webdev

I stumbled upon a discussion in the #web channel of LFE's Slack, where @oubiwann (Duncan McGreggor; [GitHub](https://github.com/oubiwann), [Twitter](http://twitter.com/oubiwann)) was sharing lots of interesting advises on architectural matters for web softwares.

I just copy-pasted everything down below! Too much gold to loose it for Slack. 😅

```
oubiwann Apr 10th at 11:15 AM
I've done TONS of web development in LFE, both web front ends and REST APIs

oubiwann  2 days ago
I've done a tiny bit of web dev in Common Lisp and various Scheme dialects

oubiwann  2 days ago
but I've done a MASSIVE amount in Clojure (100s of 1000s of lines of code)

oubiwann  2 days ago
while the ecosystem for LFE is not anywhere as mature as what Clojure enjoys (luxuriates in, actually) I much prefer web dev in LFE

oubiwann  2 days ago
the language itself is so perfectly suited to it, supplemental libraries are not actually needed as much

oubiwann  2 days ago
side note: the best Clojure libraries I've used for web dev are not actually compojure and ring (though I did use the first initially, and all the ring libs for much of my time in the Clojure ecosystem), but rather what I used towards the end of my time at NASA: https://github.com/metosin/reitit

oubiwann  2 days ago
any future LFE work I do around HTTP / REST / routes macros will be 100% influenced by that library

oubiwann  11:16 AM
not much recently, though
11:16
regardless, LFE is truly fabulous for this type of thing (thanks to its BEAM inheritance and beautiful syntax(lessness))
11:17
what I recommend to people who want to develop services for eventual deployment is start with an OTP release right away -- don't wait!
11:17
I avoided that for years
11:17
and shouldn't have
11:18
pretty much everything I build now starts with rebar3 lfe new-release myapp

oubiwann Apr 10th at 11:20 AM
also: separate these things cleanly, in different modules:
1. routing
2. request transformations
3. business logic
4. database access (even if you start with something in-memory)
5. generation of responses

oubiwann  2 days ago
this has also been critical in my many management consulting efforts: walking into teams that were on the verge of technical and/or morale collapse, I always saw that these principles had not been followed

oubiwann  2 days ago
when mgmt or product introduced radical new changes, the whole codebase had to be touched, instead of just changing the bits of code that implemented the product-specific bits

oubiwann  2 days ago
morale always radically changed a) after I worked with them to refactor to proper separation of concerns, and b) upon receiving the next request from mgmt to make radical changes ....

oubiwann  2 days ago
they never can believe their eyes when these refactors help them make changes in minutes vs their previous months

oubiwann  2 days ago
back to the bullet points:
1. this is very simple, format and approach depends almost entirely upon the selected framework (if you have to roll your own, of course this will be much more involved!)
2. this should contain no HTTP response-related code (or any of the other things mentioned in the list); this is all about transforming all required data sent in the request (params, query strings, POSTed body, URL paths, etc.) into an application representation (e.g., one or more Erlang maps or LFE records) -- DON'T use the framework's (or the underlying HTTP lib's) data structures for this! Your app needs to be losely coupled to those (you need to be able to easily replace them with another, without having your application suffer from vendor lock-in!)
3. this is where all the crazy shit lives; don't let the insanity here impact any other part of your app -- no leaky abstractions!
4. I've found the best way to handle this one is do define an app-specific internal API for data access, and hide the underlying implementation details behind that (VERY useful when switching out backends / DBs)
5. this last one is often skipped -- don't fall into that trap! It's usually a small amount of code, but you want your responses, errors presented to consumers, etc., to be easy to test, maintain, and to get new features (all of which should happen without touching any other part of your project)
(edited)

oubiwann  2 days ago
think carefully about error propogation (edited)

oubiwann  2 days ago
I'd seriously recommend creating a single data structure representing both "results" and "errors" and making sure this is passed and transformed appropriately from the first bullet to the last (edited)

oubiwann  2 days ago
this would, of course, be affected by how you handle errors inside the app and how much you present to the final consumer of the app/API

oubiwann  2 days ago
you want to protect yourself from revealing too much of your app's internal workings to a public consumer or to bad actors that might take advantage of these errors to exploit potential vulnerabilities hinted at by the errors (edited)

oubiwann  11:21 AM
intermixing one or more of those has been the cause of much difficult-to-read code and origin of too many bugs
11:26
(not to mention slow-to-ship releases) (edited)
11:28
the tendency to say "oh, this is just a simple thing; I'll keep things separate in this module" is strong ... and by the time the code has evolved to something not-so-simple, it's too late (and many hard-to-see issues have already snuck into the code) (edited)

oubiwann  11:37 AM
incidentally, coding web projects in such a way also leads to much improved project delivery times -- I credit the accompanying clarity of thought (and thus code) which lends itself well to quickly iterating on logical, functional portions of a project

oubiwann  11:51 AM
two very important (and quick) reads when thinking about shipping software using the BEAM:
https://www.erlang-in-anger.com
https://adoptingerlang.org
don't let the names fool you! These are two of the best bits of principal engineer-level pieces of writing for software development and deployment; I'm constantly recommending them to non-Erlangers for reading
```
