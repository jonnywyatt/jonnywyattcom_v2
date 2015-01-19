BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
INSERT INTO `schema_migrations` VALUES ('20140922213718');
CREATE TABLE "articles" (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`title`	varchar(255),
	`intro`	text,
	`text`	text,
	`date_created`	datetime,
	`date_published`	datetime,
	`is_published`	boolean,
	`created_at`	datetime,
	`updated_at`	datetime,
	`tech_used`	TEXT,
	`url`	TEXT
);
INSERT INTO `articles` VALUES ('1','Pension calculator from the Money Advice Service','<div class="article__image article__image--small"><a href="http://www.moneyadviceservice.org.uk/en/tools/pension-calculator"><img src="https://jonnywyatt.files.wordpress.com/2014/10/pension_calc.png" alt="" /></a></div>
<p>A beta version of a new <a href="http://www.moneyadviceservice.org.uk/en/tools/pension-calculator">Pension calculator</a> has just been launched by&nbsp;the Money Advice Service.</p>
<p>It has been the result of several months of work and from a front end point of view, uses several approaches and techniques.</p>','<h2>Accessibility</h2>
<p>The Pension calculator was fully accessibility tested, to the WCAG AA level of compliance, by users of assistive technology like screenreaders and voice activation software at the<a href="http://www.digitalaccessibilitycentre.org/"> Digital Accessibility Centre</a>. The tool makes use of ajax for responsiveness, and it took a fair bit of experimentation to get updates reported via ARIA to a range of software like Voiceover, JAWS and NVDA. <a href="http://www.paciellogroup.com/blog/2012/06/html5-accessibility-chops-aria-rolealert-browser-support/">This post from Paciello Group</a> was especially helpful.</p>
<h2>A Javascript component loader</h2>
<p>I wrote a <a href="https://github.com/moneyadviceservice/dough/blob/master/assets/js/lib/componentLoader.js">component loader</a> to start up all the UI components required by a page. It uses&nbsp;RequireJS for dependency management, and Promises to report back to the loader when each component is initialised successfully (or not). It was developed using TDD techniques.</p>
<h2>Javascript unit testing</h2>
<p>I used Karma, Mocha, Chai and Sinon for testing.&nbsp;I&rsquo;ve put a basic Javascript testing <a href="https://github.com/jonnywyatt/BDD_example">template project</a>&nbsp;on Github including the testing frameworks, a module, spec and fixture. I delivered a <a title="Talk: BDD-style testing in Javascript" href="http://jonnywyatt.com/2014/07/19/talk-bdd-style-testing-in-javascript/">talk about the testing techniques I used</a> to the London Developer in Test group.</p>
<h2>An event hub</h2>
<p>The clumsily&nbsp;named <a title="A Javascript event hub using promises" href="http://jonnywyatt.com/2014/04/08/an-event-hub-using-promises/">eventsWithPromises</a> micro-library provides standard event hub methods including subscribe and publish, but also includes a promise with every event sent. The listener can then resolve or reject the promise at its leisure, eg even after an async operation such as an ajax request or animation, which will feed back to the event emitter, allowing it to act on that result. In other words, the events aren&rsquo;t &lsquo;fire and forget&rsquo;.</p>
<h2>Progressively enhanced &lsquo;app-like&rsquo; behaviour</h2>
<p>As you use sliders and other UI widgets to alter values, the interface is updated with ajax responses. There is also some addition of new text content without a full page refresh. This is achieved using data-binding rather than string templating. The bindings are&nbsp;driven from markup attributes, in a similar style to AngularJS, eg</p>
<pre class="article__code">&lt;input data-value="salary" value="30000" /&gt;</pre>
<p>The initial value is rendered on the server, then the data binding Javascript populates its data model by scraping that value, ie the above example would lead to the following model data:</p>
<pre class="article__code">{

&nbsp; salary: 30000

}</pre>
<p>When the model value is updated it is synced with the server. Any model properties that are different in the response returned from the server are then used to update the element value.</p>
<p>The library that I used for the data-binding was <a href="http://rivetsjs.com/">Rivets</a>. To watch for changes in the model I used the very lightweight <a href="http://www.helgoboss.org/projects/iota-observable/">Iota-observable</a>.</p>
<p>All data syncing was done using async form posts. If Javascript is disabled or fails, the forms will still work.</p>
<h2>Go native, don&rsquo;t fake it</h2>
<p>I used native sliders with input type=&rdquo;range&rdquo; rather than using a Javascript library to render them. Native sliders are supported from IE10 upwards and can be styled purely using CSS. Some useful references:</p>
<ul>
<li><a href="http://brennaobrien.com/blog/2014/05/style-input-type-range-in-every-browser.html">How to Style Input Type Range in Chrome, Firefox, and IE</a></li>
<li><a href="http://codepen.io/aronwoost/pen/nlyrf">Codepen example</a></li>
</ul>
<h2>Modular CSS using BEM, SASS and OOCSS</h2>
<p>I&rsquo;ve used <a href="http://bem.info/">BEM</a> on my last two projects and it&rsquo;s invaluable. Naming things is, after all, <a href="http://martinfowler.com/bliki/TwoHardThings.html">tough</a>. At first glance it can look verbose if you&rsquo;re used to your HTML being as uncluttered as possible, but the predictability it introduces far outweighs this.</p>
<p>Every UI component has a corresponding SASS file with all selectors prefixed with that component name eg. .tab-selector__target.</p>
<p>We write CSS for maintainability first, rather than prioritising clean HTML. Some references:</p>
<ul>
<li><a href="http://nicolasgallagher.com/about-html-semantics-front-end-architecture/">Nicolas Gallagher</a></li>
<li><a href="http://philipwalton.com/articles/css-architecture/">Philip Walton</a></li>
</ul>
<h2>Frequent user testing</h2>
<p>We had a dedicated user testing lab and recruited testers that reflected our target demographic, ie people who typically hadn&rsquo;t saved for a pension. Sessions were lightly facilitated, video&rsquo;d and the whole team could go and observe the sessions which was incredibly effective for getting everyone bought&nbsp;into the product&rsquo;s direction.</p>
<h2>&hellip; and lessons learned?</h2>
<p>Release early, then iterate. We were made to wait way too long &ndash; 6 months &ndash; before our initial release.</p>',NULL,'2014-10-16 00:00:00.000000','t','2014-12-24 13:24:13.438641','2014-12-27 12:09:30.517190',NULL,NULL);
INSERT INTO `articles` VALUES ('2','Talk: BDD-style testing in Javascript','<p><a href="https://skillsmatter.com/skillscasts/5492-bdd-and-test-automation-e2e-test-example">A short talk I gave last week</a> to the London &lsquo;Dev in Test&rsquo; meetup group about testing Javascript with BDD syntax and Karma / Mocha.</p>',NULL,NULL,'2014-07-19 00:00:00.000000','t','2014-12-24 16:31:53.079808','2014-12-24 23:57:28.769427',NULL,NULL);
INSERT INTO `articles` VALUES ('3','Portfolio: Which? Home Entertainment','<p>Which? is a powerful brand in the UK, combining highly trusted product reviews with consumer advice and campaigning.</p>
<p>Their web site attracts millions of visits each month and helps drive their large subscription base. The project was a responsive rebuild of the <a href="http://www.which.co.uk/tv-and-home-entertainment">Home Entertainment Reviews segment</a>, beginning with TVs.</p>','<p>TV reviews are presented with high-impact use of 3D rotating images overlayed with tech highlights and the all-important Which? score and review breakdown. Review sections were loaded with pushstate for speed. We integrated with other review APIs such as Reevoo and Pluck.</p>
<div class="article__image"><a href="http://www.which.co.uk/tv-and-home-entertainment"><img src="http://jonnywyatt.files.wordpress.com/2014/06/sony-bravia-kdl-42w705b-television-review-summary-which.jpg?w=645" alt="Sony Bravia KDL 42W705B television review summary   Which" /></a></div>
<p>My&nbsp;biggest areas of learning included&nbsp;BDD with&nbsp;Cucumber / Capybara, <a title="Balancing functional and unit tests" href="http://jonnywyatt.com/2014/01/12/bdd/" target="_blank">a bit of a revelation for me</a>. Also responsive / mobile techniques; in hindsight this project should have used a fully mobile-first&nbsp;development approach. We tested&nbsp;Javascript at the behavioural rather than low level and used SASS / BEM / OOCSS to create predictable, re-usable styling patterns.</p>
<p>Working with Rails for the first time&nbsp;and understanding more of the web stack was very empowering; when this contract ended I immediately sought out another using Rails. It has its weaknesses &ndash; the Asset Pipeline is a bit too tightly integrated with the front end for comfort &ndash; but the speed and ease that you can piece together and debug an app will be a revelation to any front end dev.</p>',NULL,'2014-06-16 00:00:00.000000','t','2014-12-24 16:34:25.049245','2014-12-24 23:32:27.406525',NULL,NULL);
INSERT INTO `articles` VALUES ('4','A Javascript event hub using promises','<p>The event hub / aggregator pattern is fantastic for decoupling code modules but the emitted events are usually &lsquo;fire and forget&rsquo; so if the event listeners want to feed back an error or status report to the event emitter, they can&rsquo;t.</p>
<p>Adding promises solves this &ndash; if the event is published then each event listener will receive its own promise. Once the listener has performed any synchronous / async tasks that it needs to, it can choose to resolve or reject the promise it has received. If all event listeners report success using their promises, then a promise passed back to the emitter will resolve successfully. However if one or more of the listeners reject (fail) their promises, it&nbsp;will fail.</p>
<p>Because the event listeners are receiving promises, they can wait until async activities eg. ajax are complete before resolving their promise. Handy if decoupled modules need to save state or complete animations before feeding back to the event emitter.</p>
<p><a href="https://github.com/jonnywyatt/eventsWithPromises">The code is on Github</a>, hope it helps someone!</p>',NULL,NULL,'2014-04-08 00:00:00.000000','t','2014-12-26 16:39:33.326764','2014-12-26 16:39:33.326764',NULL,NULL);
INSERT INTO `articles` VALUES ('5','Balancing functional and unit tests','<p>It&rsquo;s been a year and a day since <a title="Testing a RequireJS / Backbone component with Jasmine and&nbsp;jsTestDriver" href="http://jonnywyatt.com/2013/01/11/testing-a-requirejs-backbone-component-with-jasmine-and-jstestdriver/">my last post</a>. Plenty has been going on in the last 12 months. I finally took the dive into mobile that I&rsquo;d been putting off until the tools improved, with a rebuild at Which? in London.</p>
<p>Which? made some bold technology decisions to break with their legacy codebase. Previously using Java in the web app and API layers of the stack, they kept it for the API and adopted Ruby on Rails for the web application.</p>','<p>I&rsquo;d heard great things about how fast you could build stuff with Rails. I didn&rsquo;t come to front end development via a server side language so a framework like Rails, that gives an easier introduction to that layer, has great appeal. Without a doubt it&rsquo;s enabling and makes you a better all-round developer.</p>
<p>Another big thing that learning Ruby has given me is the ability to <strong>write automated UI tests</strong> with Cucumber. I had heard about CucumberJS early last year but it looked a bit in-progress. Cucumber with Ruby looked more complete with better docs and plugins.</p>
<p>Regarding BDD and the practise of describing features using Given.. When.. Then syntax, that are readable by the business &ndash; I&rsquo;d heard experienced consultants saying things like</p>
<blockquote>
<p>&ldquo;Feature files are a nice idea but I&rsquo;ve never actually&nbsp;seen them used by a business in real-life&rdquo;</p>
</blockquote>
<p>I don&rsquo;t buy that view &ndash; at Which? the features have been described by a business analyst in Jira then handed over to us to automate. We might make some minor tweaks in language not meaning, to make it possible to automate them.</p>
<p>The company, developers and QA then have a clear contract for what we&rsquo;re building, and even better, we can code directly against it. When we fulfil the contract, the tests turn green.</p>
<p>BDD is of course an investment &ndash; in mocking up the data, working out robust ways to test the code, trying to make the tests run as fast as possible, and dealing with occasional (and sometimes inexplicable) fragile tests that work one minute then fail the next.</p>
<h2>Finding a balance between unit and UI tests</h2>
<p>Have you ever had someone display a diagram of a testing pyramid and declare that <em>unit tests are far quicker to write than UI tests</em>? I&rsquo;ve not always found that. I&rsquo;ve often found Javascript unit tests are at least as expensive to write, largely because you&rsquo;re mocking out so many of the surrounding components &ndash; HTML fixtures, API data, other Javascript widgets, third party code. That&rsquo;s all fine, and unit tests are essential, but I swear they&rsquo;re not significantly quicker to write. They are of course many times quicker to run &ndash; moments after you saved a change your entire suite of hundreds of unit tests can have completed and it&rsquo;s that fast feedback loop that is one big reason to write them.</p>
<p>You burn through a lot more unit tests because they&rsquo;re more tightly tied to the implementation, which in any decently maintained codebase should be evolving constantly as it&rsquo;s refactored. Parts of your code inevitably get thrown away, implementations change and the unit tests frequently turn red until you turn them green again or remove the redundant ones.&nbsp;The closer the tests are to the metal, the more ephemeral they are.</p>
<p>On the other hand, a UI test, once turned green should only turn red infrequently &ndash; if there&rsquo;s a breakage in the interface, or if a refactor is significant enough to require the parts of the step definitions that touch the implementation, to need updating.</p>
<p>Again, am I saying don&rsquo;t write unit tests? Absolutely not. They can guide the design of lower-level logic and help find flaws in it. And they can instantly expose regressions as you refactor.</p>
<p>I&rsquo;m just questioning some commonly received wisdom that you should have <strong>orders of magnitude</strong> more unit tests than UI tests. All tests are an investment &ndash; the time spent writing and maintaining them gets paid back in fewer regressions and production bugs.</p>
<p>I&rsquo;m totally sold on the BDD way of working now. You won&rsquo;t always find it happens in a project &ndash; I&rsquo;ve come across the odd very capable front end developer who didn&rsquo;t see it as part of their role to write UI tests. Although it was in a technology stack that didn&rsquo;t make it easy to write UI tests (hello Java).</p>
<p>Some QAs get nervous about developers doing it, but they shouldn&rsquo;t.&nbsp;<span style="line-height: 1.4;">If the devs write UI tests for the web app that mock out services like authentication and APIs, then it frees up the QAs to write those true end-to-end tests using real copies of the services.</span></p>
<p>&nbsp;</p>
<p>Writing tests and seeing them run green gives calm to the developer. You don&rsquo;t get that sick feeling in the run-up to a release that you might have caused regressions with your last commit, but aren&rsquo;t sure where. The better your tests, the more secure you feel. If you haven&rsquo;t, try it!</p>',NULL,'2014-01-12 00:00:00.000000','t','2014-12-26 16:41:20.014990','2014-12-27 12:11:44.874642',NULL,NULL);
INSERT INTO `articles` VALUES ('6','Testing a RequireJS / Backbone component with Jasmine and jsTestDriver','<p>If you want to use Jasmine to test something that&rsquo;s inside a RequireJS module, for example a Backbone model, you need to find a way to load the Require module from your Jasmine spec, and pause the running of the test spec until the module is loaded and ready.</p>
<p>I need a few things loaded up front for my tests to run &ndash; Require itself, Backbone, jQuery, Underscore.</p>','<p>First of all I&rsquo;ll load require.js from my jsTestDriver.conf.</p>
<p>Backbone is expressed as a dependency in my require.config, and will in turn pull in the other two libraries:</p>
<script src="https://gist.github.com/jonnywyatt/06231f02a0442e11f441.js"></script>
<p>Now I can load the main RequireJS config file, and hence those dependencies, by loading an extra require.config snippet, which specifies where files can be found under the test server, and then loads the main config itself:</p>
<script src="https://gist.github.com/jonnywyatt/139d7cce6092888d96d5.js"></script>
<p>Now if I run jsTestDriver, my dependencies are all loaded up, plus my require.config, but not my application. This matters as I should only need to load in the specific module I want to test. I can do this using a&nbsp;require call inside my test setup (beforeEach). Wrap it in a &ldquo;runs&rdquo; block then use a &ldquo;waitsFor&rdquo; block to halt things until it&rsquo;s loaded.</p>
<script src="https://gist.github.com/1ab74ffa39a24aa7125f.js"></script>
<p>These patterns took a while for me work out when I started testing Require / Backbone apps using Jasmine. Hope this helps somebody!</p>',NULL,'2014-01-11 00:00:00.000000','t','2014-12-26 16:43:56.430363','2014-12-27 12:06:12.063450',NULL,NULL);
INSERT INTO `articles` VALUES ('7','Backbone Marionette - using nested views','<p>For the past few months I''ve been picking up <a href="http://backbonejs.org" target="_blank">Backbone</a>, then <a href="http://marionettejs.com" target="_blank">Marionette</a>.</p>
<p>I quickly liked and later cursed the fact that Backbone gives you some structure yet lots of flexibility, especially around managing views.</p>
<p>At the start the flexibility makes picking things up conceptually easy. As you move beyond the most basic app you need to keep the creation and destruction of views under control, especially when you start nesting them. Backbone gives you very little to handle this, but Marionette plugs the gap nicely.</p>','<h2>Terms used in Marionette</h2>
<ul>
<li>A <strong>layout</strong>&nbsp;is a type of view that can hold other views</li>
<li>The element within that layout that holds / wraps the nested view, is called a <strong>region</strong>. A region can hold one view at a time. It can reload the same view multiple times as required, or swap in different types of view.</li>
<li>Marionette.Layout actually extends Backbone.View (not directly, but it does inherit from it). So as a layout is a type of view, you can actually nest a layout inside a region of another layout</li>
</ul>
<h2>The markup</h2>
<p>Your template for the outer layout might be:</p>
<p>
<script src="https://gist.github.com/jonnywyatt/e6b3edab8e9b2f92c5de.js"></script>
</p>
<p>.. and your template for the view to be nested inside the region:</p>
<script src="https://gist.github.com/jonnywyatt/fcefbae3fed1be87b694.js"></script>
<p><strong>Note - I prefer that the container element for the nested view shouldn''t be in the parent layout template (it should be created dynamically by the view''s Javascript definition)</strong></p>
<p>WRONG:</p>
<p>
<script src="https://gist.github.com/jonnywyatt/980d096c8f5de802b5cc.js"></script>
</p>
<p>RIGHT:</p>
<p>
<script src="https://gist.github.com/jonnywyatt/a62fdbcbfe83d21c46ec.js"></script>
</p>
<p>Why? I think the view should control its container element, it''s more maintainable. You know that everything relating to that view is in one place in your codebase and there are no fragments of the view contained in other templates.</p>
<h2>The Javascript</h2>
<p>The outer layout can use its regions to show views, when it has been rendered itself. Use the ''show'' method of the layout''s region. When you call ''show'' it automatically calls the render method on the subview.</p>
<p>
<script src="https://gist.github.com/jonnywyatt/e1e970e8e4b7dbbed177.js"></script>
</p>
<p>The View definition for the nested view would contain a className attribute so the view container will be created dynamically when the view is rendered.</p>
<p>You can hook into the onRender and onShow events.</p>
<p>
<script src="https://gist.github.com/jonnywyatt/8584bb65fbefb498ba69.js"></script>
</p>
<h3>What''s the difference between onRender and onShow?</h3>
<p>Remember that when the parent region''s ''show'' method is called, it automatically calls render on the subview as well, so onRender will of course be triggered after that. At this point the view has been templated and a DOM fragment created. However it hasn''t yet been attached to the parent region so it''s still only in memory and not actually part of the page yet. If you put a breakpoint in the onRender and in your browser console looked for a parent of this.$el (the view''s container element):</p>
<pre>this.$el.parent(''body'').length</pre>
<p>it would return 0.</p>
<p>The onShow event fires after the view has been attached to its parent region. If you ran the same line in your console during the onShow event, it would return 1.</p>
<h2>More reading on Layouts</h2>
<p>Marionette provides structure in the biggest areas left vacant by Backbone. One of the best things about it is its creator Derick Bailey is a prolific blogger and documenter (and <a href="http://stackoverflow.com/questions/tagged/backbone.marionette" target="_blank">Stackoverflow lifesaver</a>).</p>
<p>Check out his blog post -&nbsp;<a href="http://lostechies.com/derickbailey/2012/03/22/managing-layouts-and-nested-views-with-backbone-marionette/" target="_blank">Managing Layouts and Nested Views with Backbone.Marionette</a>&nbsp;and the&nbsp;<a href="https://github.com/marionettejs/backbone.marionette/blob/master/docs/marionette.layout.md" target="_blank">Marionette docs on Layout</a>.</p>',NULL,'2012-12-21 00:00:00.000000','t','2014-12-27 12:17:50.203640','2014-12-27 12:19:01.007990',NULL,NULL);
INSERT INTO `articles` VALUES ('8','Slides: Front end architecture and page load speed','<p><span style="line-height: 1.4;">&ldquo;Speed is a feature&rdquo; and I think the trend of templating the initial page render on the client negatively impacts performance, and also robustness and device independence.</span></p>
<p>Don&rsquo;t get me wrong, Backbone, async updates and responsive web apps are all fantastic and I use them enthusiastically. But I think they should build on a solid first delivery of the page as markup &ndash; it will work more consistently on the ridiculously wide range of devices out there. You&rsquo;re then taking fewer risks in the &ldquo;hostile environment of the browser&rdquo;. I think someone once called it Progressive Enhancement&hellip;</p>
<p>Twitter&rsquo;s <a href="http://engineering.twitter.com/2012/05/improving-performance-on-twittercom.html" target="_blank">recent rebuild</a>&nbsp;shows they came to the same conclusion.</p>
<p><iframe id="scribd_117288833" class="scribd_iframe_embed" src="//www.scribd.com/embeds/117288833/content?start_page=1&amp;view_mode=&amp;access_key=key-17qimayzdfq7v9s4kcht" width="100%" height="500" frameborder="0" scrolling="no" data-auto-height="true"></iframe></p>
<div style="font-size: 10px; text-align: center; width: 100%;"><a href="http://www.scribd.com/doc/117288833">View this document on Scribd</a></div>',NULL,NULL,'2012-12-18 00:00:00.000000','t','2014-12-27 12:37:32.106251','2014-12-27 12:37:32.106251',NULL,NULL);
INSERT INTO `articles` VALUES ('9','betfair.com rebuilt for speed','<p><strong>Betfair&rsquo;s completely rebuilt sports betting site &ndash; <a href="http://beta.betfair.com/football" target="_blank">http://beta.betfair.com/football</a></strong></p>
<p><em><strong>I used:</strong> Javascript | YUI3 | CSS3 | LESS | HTML5 API&rsquo;s | Agile | Performance optimisation</em></p>
<p>I just completed a 12 month contract with Betfair Plc in Hammersmith to help rebuild their sports betting site from the ground up. The project had two main aims &ndash; make it robust, and blazing fast.</p>
<p><a href="http://beta.betfair.com/football" target="_blank">betfair.com</a> is high volume &ndash; its&nbsp;3.7 million customers in 140 countries have &pound;300M on deposit. Notable spikes in usage include the 2010 World Cup Final (&pound;68M traded) and the Grand National (30,000 bets placed in a single minute).</p>
<p>Performance had been shown to have a direct correlation with revenue. Make the site faster, and people place more bets. Simples.</p>','<p>The old site had pushed most processing and rendering duties to the browser, resulting in a morass of several MB of Javascript and a page load time of 15 &ndash; 20 seconds. The aim was to reduce that to 3s. That&rsquo;s in the slowest browser, with an empty cache, on an average 4Mb connection.&nbsp;And &lsquo;page loaded&rsquo; doesn&rsquo;t just mean downloaded and rendered, it includes all Javascript initialised so the page is usable. It&rsquo;s no fun if you make things easy is it?</p>
<p style="text-align: center;"><img class="aligncenter size-full wp-image-385" style="line-height: 18px; border: 4px solid #cccccc;" title="Betfair''s new site" src="http://jonnywyatt.files.wordpress.com/2012/01/grab_betfair.png?w=645" alt="Betfair''s new site" /></p>
<p>I worked as front end developer on the team providing &lsquo;core&rsquo; services including login and navigation. I also had a dedicated period to work purely on performance and get that load time closer to the magic 3 second mark.</p>
<div>
<p>2011 was<span style="line-height: 18px;">,</span><span style="line-height: 18px;">&nbsp;</span>without doubt, the most intensive period of learning I&rsquo;ve experienced in my professional career. What did I learn on the Betfair project? Well&hellip;</p>
<h2>Testing</h2>
<p>It&rsquo;s no exaggeration to say my outlook as a developer was reconstructed.</p>
<p>I&rsquo;ve enough to say on testing front end code for a future post.&nbsp;I&rsquo;m not sure how other people found it, but for me this was a major change in approach from what I was used to and a bit of a journey, not a quick turnaround.&nbsp;In a nutshell -</p>
<ul>
<li>It subverts your approach to coding, from being DOM focussed.</li>
<li>When you say a piece is dev complete, it should mean you also have test coverage and the tests are running green.</li>
</ul>
<h2>Agile</h2>
<p>I hadn&rsquo;t *done* Agile to this degree previously. Here&rsquo;s how the experience unfolded for me -</p>
<h3>Pre-launch</h3>
<p>There was an initial construction phase lasting several months, to get the first release of the product out. You&rsquo;re involved in a *lot* of user story workshops, definition and pointing. Plenty of &ldquo;known unknowns&rdquo; and a certainty there were several &ldquo;unknown unknowns&rdquo; lurking.</p>
<p>After a period of investigating each area of functionality to flush out problems and detail, we fell into a more formal scrum process &ndash; 2 week sprints drawing from the new backlog.</p>
<p>My whole perspective at this stage, with little experience of Agile to draw on, was from the &lsquo;front&rsquo; of the project &ndash; get stuff defined, get to work on it.&nbsp;I&rsquo;d had a lot of experience of working up to launches and deadlines, but little awareness of the hard yards needed to get stuff through to production in an &lsquo;Agile&rsquo; manner, in other words&hellip;</p>
<h3>Continuous delivery</h3>
<p>So had I already experienced the main parts of Agile in defining and working through user stories? If we focused just on the execution of a series of sprints would it be enough for the shiny new features to drop off the conveyor belt?</p>
<p>Nope.</p>
<p>The critical factors, I learned, are</p>
<ul>
<li>Automated tests &ndash; both javascript unit tests (we used Jasmine for this), and acceptance tests (Selenium 2 / Webdriver, scripted with Groovy). The tests have to be quick to write, quick to run, and must be run frequently. The results have to be visible to developers, ie &ldquo;in your face&rdquo; visible, not that you have to go looking for them. If you have this, you can develop, refactor and bug fix without that queezy feeling in your stomach that your next commit might introduce regressions, and bug fixing doesn&rsquo;t resemble &lsquo;whack-a-mole&rsquo;.</li>
<li>A fast, stable delivery pipeline</li>
</ul>
<p>In other words the stuff enabling the end of the production process, not the start. But you have to begin to address them, especially automated testing, right from the start.</p>
<h2>YUI3</h2>
<p>Before using YUI3 I thought &ldquo;Why do you need more than jQuery?&rdquo;.</p>
<p>Working with another library actually threw into relief jQuery&rsquo;s strengths (especially the great API docs with embedded examples) and weaknesses (OK so it&rsquo;s not even designed to structure your code, but it will, if you don&rsquo;t know any better &ndash; as many jQuery starters don&rsquo;t &ndash; ie. lots of nested callbacks).</p>
<p>YUI3 has some fantastic features -</p>
<ul>
<li>the attribute system lets your objects have properties with getters / setters, onChange events and validation all built in</li>
<li>the loader system lets you split your YUI modules across separate files that load in parallel and may complete at different times, but will ensure all the dependencies execute in the correct order</li>
<li>you get helper methods for things like objects, arrays, console logging</li>
</ul>
<h2>Performance</h2>
<p>This was a cornerstone of the project and integral to decision making from the outset. There was an SLA commitment that each page will load in 3 seconds or less. This is important &ndash; it gives the leverage needed to influence each technical and design decision made.</p>
<p>2 imagined conversations -</p>
<p><em>Between front end and server side engineers -</em><br /> Q. Do we render HTML on the server or template it in the browser?<br /> A. On the server &ndash; it&rsquo;s faster, more robust and there&rsquo;s less to download to the client</p>
<p><em>Between designers and front end developers -</em><br /> Q. Do we use sliced graphics to do rounded corners in IE7/8?<br /> A. No &ndash; use&nbsp;CSS3 for capable browsers falling back to square corners for IE. Would IE users rather have a slow site with a few rounded corners?</p>
<p>Some pointers -</p>
<ul>
<li>Balance the application correctly between the server and browser</li>
<li>Consider performance from the beginning and at every step &ndash; don&rsquo;t leave it to the end</li>
<li>Record &lsquo;real world&rsquo; performance &ndash; eg. full round trip time. We rolled our own but for an out-the-box solution check out <a href="http://yahoo.github.com/boomerang/doc/" target="_blank">Yahoo Boomerang</a></li>
<li>Take a baseline using&nbsp;<span style="line-height: 18px;">&nbsp;a &lsquo;private instance&rsquo; copy of&nbsp;</span><a href="http://www.webpagetest.org/" target="_blank">Webpagetest</a>. Make your optimisations, run the page again on your dev server in Webpagetest, see the difference. In other words make performance gains measurable.</li>
</ul>
<h2>So did all this work?</h2>
<p>The site is being rolled out in the UK during early 2012 &ndash; currently some users are being diverted to the new experience which you can see at <a href="http://beta.betfair.com/football" target="_blank">beta.betfair.com/football</a>. In the coming weeks 100% of customers will get the new site.</p>
<p>Some early metrics from sessions using the new beta site -</p>
<ul>
<li>Sessions that bet &ndash; up 2%</li>
<li>Bounce rate &ndash; improved 40%</li>
</ul>
<p>Check out this presentation on the Betfair rebuild at <a href="http://velocityconf.com/velocityeu/public/schedule/detail/21773" target="_blank">Velocity Europe 2011</a>.</p>
</div>',NULL,'2012-01-08 00:00:00.000000','t','2014-12-27 13:50:49.786740','2014-12-27 13:50:49.786740',NULL,NULL);
INSERT INTO `articles` VALUES ('10','Video news hub for Associated Press','<p><strong><a href="http://www.apvideohub.com" target="_blank">http://apvideohub.com</a></strong></p>
<p><em><strong>I used:</strong>&nbsp;OO Javascript | Unit testing | HTML5 | CSS3 | LESS | Selenium IDE</em></p>
<p>Associated Press is a 150 year old institution,&nbsp;the largest and most trusted newsgathering operation in the world. Their&nbsp;video archive includes over 1.5 million global news and entertainment stories dating back to the beginning of the 20th Century.</p>
<p>Their brand new site,&nbsp;<a href="http://apvideohub.com" target="_blank">AP Video Hub</a> offers curated archive content mixed with breaking news topic pages, for preview and download in a variety of broadcast-ready formats.&nbsp;I was the front end developer on the project.</p>
<p>The beta version of the site has just gone live (April 2012) and is already generating major interest from media organisations.</p>','<p><a href="http://jonnywyatt.files.wordpress.com/2012/05/apvideohub3.jpg"><img class="aligncenter size-full wp-image-493" title="apvideohub" src="http://jonnywyatt.files.wordpress.com/2012/05/apvideohub3.jpg?w=645" alt="" /></a></p>
<h2>Performance</h2>
<p>The primary aims for the interface were speed and simplicity. We used server side templates and minimised the initial payload of Javascript, CSS and thumbnail images to make the above the fold render time as fast as possible.&nbsp;Other assets were lazily loaded after initial render, eg. instant search index, below the fold thumbnails, and the two remaining main views, to give a highly responsive experience.</p>
<h2>Progressively enhanced single page app</h2>
<p>I didn&rsquo;t want to take the performance hit of rendering the initial page load using Javascript templating, so used server side templates (Razor). The 3 main views are switchable using left hand nav links.</p>
<p><span style="line-height: 18px;">I&rsquo;d previously seen the History API used in the great&nbsp;</span><a style="line-height: 18px;" href="https://github.com/balupton/history.js">Github</a><span style="line-height: 18px;">&nbsp;interface with real URLs and ajax-powered view switching.&nbsp;</span>Where the browser supports the History API, I intercept the any clicks on the links and reload just the main content panel using Ajax. The Ajax call is routed to the same server side template that&rsquo;s used for the whole page load, and only the section of that template for the main content area is returned.</p>
<p>This setup gives the following benefits -</p>
<ul>
<li>progressive enhancement eg. the nav links function normally if the browser doesn&rsquo;t support javascript or the History API, and reload the whole page with the changed URL / view. If History API is supported, you get ajax content switching</li>
<li>the History API means the URL changes as you switch views so you can bookmark / revisit.</li>
<li>speed &ndash; only a portion of the page is reloading so it&rsquo;s very fast</li>
<li>you only need to maintain one set of server side templates, and either the whole template is returned eg. if the user has hit a URL directly; or if an ajax request part of the template is returned</li>
</ul>
<h2>Code structure and testing</h2>
<p><span style="line-height: 18px;">I used techniques I&rsquo;d learnt on&nbsp;</span><a style="line-height: 18px;" title="Portfolio: betfair.com rebuilt for&nbsp;speed" href="http://jonnywyatt.com/2012/01/08/portfolio-betfair-com-rebuilt-for-speed/">Betfair&rsquo;s site rebuild</a><span style="line-height: 18px;">&nbsp;to structure the code in a modular fashion.</span> <span style="line-height: 18px;">&nbsp;</span>Webstorm is firmly my favourite IDE now and brings built in Javascript unit testing with jsTestDriver. Simple to hook in Jasmine, and write tests easily, spawn test browsers and run the whole suite without leaving the IDE.</p>
<p>I also wanted to find a way to get higher-level functional test coverage and picked up Selenium IDE for the first time. I rate it better than Selenium 2 / Webdriver as a tool for developers to generate and run tests quickly, which I think is critical for test coverage to keep pace with development.</p>
<p>The site is iPad and iPhone compatible &ndash; an HTML5 video container used instead of the default Silverlight.</p>
<p>It&rsquo;s been a great contract to work on &ndash; a talented team and a trusting and accessible client in AP. And I&rsquo;ll miss the daily dive into Camden&rsquo;s food stalls <span class="wp-smiley wp-emoji wp-emoji-smile" title=":)">:)</span></p>',NULL,'2012-05-02 00:00:00.000000','t','2014-12-27 13:52:53.389584','2014-12-27 13:52:53.389584',NULL,NULL);
INSERT INTO `articles` VALUES ('11','Interactive graphs for online banking','<p><strong><a href="http://www.garanti.com.tr/en/personal_banking/delivery_channels/internet_banking.page" target="_blank">Garanti Bank&rsquo;s</a> new Internet banking system. Developed at <a href="http://lbi.com" target="_blank">LBi</a></strong></p>
<p><em><strong>I used:</strong> Javascript | Rapha&euml;l&nbsp;| SVG | Ajax</em></p>
<p>Internet banking, as I was used to it before this project, presented data no more imaginatively than rows of tabular data. This project for Garanti Bank in Turkey used beautiful interactive and animated pie and bar charts to present transaction summaries.</p>
<p>We wrote our own graphing library and used the Raphael library to render the vector graphics. The graph data was supplied in JSON format.</p>
<p>The Javascript code was organised using simple classical inheritance with the pie and bar types extending a base graph type. JSON templating was used to render the tooltip panels.</p>
<p><a href="http://jonnywyatt.files.wordpress.com/2011/10/grab_raphael2.png"><img class="aligncenter size-full wp-image-366" title="grab_raphael" src="http://jonnywyatt.files.wordpress.com/2011/10/grab_raphael2.png?w=645" alt="" /></a></p>',NULL,NULL,'2011-11-30 00:00:00.000000','t','2014-12-27 13:54:34.947733','2014-12-27 13:54:34.947733',NULL,NULL);
INSERT INTO `articles` VALUES ('12','Running Javascript unit tests in your build with Jasmine and Maven','<p>We wanted to run our Javascript unit tests with our Maven build. If the tests failed, we wanted the build to fail as well &ndash; we&rsquo;re playing hardball!</p>
<p>We used:</p>
<div>
<ul>
<li><a title="Maven" href="http://maven.apache.org">Maven&nbsp;</a>- a build tool &ndash; it processes your set of instructions for the build, stored in a .pom file</li>
<li><a title="Jasmine Maven plugin" href="https://github.com/searls/jasmine-maven-plugin">Jasmine Maven plugin</a>&nbsp;&ndash; &nbsp;runs your Jasmine tests from your Maven build. The plugin contains a copy of the&nbsp;<a title="Jasmine" href="https://github.com/pivotal/jasmine/wiki">Jasmine</a>&nbsp;javascript test assertion framework.</li>
</ul>
</div>','<h2>How does it work?</h2>
<p>The unit tests themselves are written in Javascript, using Jasmine syntax.</p>
<p>The maven plugin includes a headless browser (HTMLUnit) &ndash; no need to set up and link in a test browser, this is all taken care of by the plugin. It opens the browser automatically, runs your tests, then closes the browser.</p>
<p>Test results are output to JUnit format XML. In theory your CI reporting can then pick this up to report on coverage. XML is output to target\jasmine\TEST-jasmine.xml</p>
<h2>Folder structure</h2>
<p>Our code base is organised into modules. The unit tests for a module sit with the source code files for that module.</p>
<p><strong>webapp/</strong></p>
<p style="padding-left: 30px;"><strong>modules/</strong></p>
<p style="padding-left: 60px;"><strong>my-module/</strong></p>
<p style="padding-left: 90px;">controller.js</p>
<p style="padding-left: 90px;"><strong>tests/</strong></p>
<p style="padding-left: 120px;">unit-tests-controller.js</p>
<p style="padding-left: 120px;"><strong>stubs/</strong></p>
<p style="padding-left: 150px;">data.json</p>
<h2>Setup of maven plugin</h2>
<p>Add the following plugin to&nbsp;your project pom.xml, inside the default profile&rsquo;s &lt;build&gt; section:</p>
<pre>&lt;plugin&gt;
   &lt;groupId&gt;com.github.searls&lt;/groupId&gt;
   &lt;artifactId&gt;jasmine-maven-plugin&lt;/artifactId&gt;
   &lt;version&gt;1.0.2-beta-2&lt;/version&gt;
   &lt;executions&gt;
       &lt;execution&gt;
           &lt;goals&gt;
               &lt;goal&gt;generateManualRunner&lt;/goal&gt;
               &lt;goal&gt;resources&lt;/goal&gt;
               &lt;goal&gt;testResources&lt;/goal&gt;
               &lt;goal&gt;test&lt;/goal&gt;
           &lt;/goals&gt;
           &lt;configuration&gt;
               &lt;jsSrcDir&gt;${basedir}/src/main/webapp/modules&lt;/jsSrcDir&gt;
               &lt;sourceIncludes&gt;
                   &lt;include&gt;modules/*/*.js&lt;/include&gt;
                   &lt;include&gt;modules/*/tests/stubs/*.js&lt;/include&gt;
               &lt;/sourceIncludes&gt;
               &lt;sourceExcludes&gt;
                   &lt;exclude&gt;modules/*/tests/*.js&lt;/exclude&gt;
               &lt;/sourceExcludes&gt;
               &lt;jsTestSrcDir&gt;${basedir}/src/main/webapp/modules&lt;/jsTestSrcDir&gt;
               &lt;specIncludes&gt;
                   &lt;include&gt;*/tests/*.js&lt;/include&gt;
               &lt;/specIncludes&gt;
               &lt;specExcludes&gt;
                   &lt;exclude&gt;*/*.js&lt;/exclude&gt;
                   &lt;exclude&gt;*/tests/stubs/*.*&lt;/exclude&gt;
               &lt;/specExcludes&gt;
           &lt;/configuration&gt;
       &lt;/execution&gt;
   &lt;/executions&gt;
&lt;/plugin&gt;</pre>
<h3>Configuration</h3>
<p>Check&nbsp;<a href="https://github.com/searls/jasmine-maven-plugin#readme" target="_blank" rel="nofollow">https://github.com/searls/jasmine-maven-plugin#readme</a>&nbsp;(Configuration section)</p>
<p>Note we&rsquo;ve slimmed down the number of goals used, in the example above.</p>
<p>Basically there are 2 sets of resources needed to run tests:</p>
<ul>
<li>Source files &ndash; ie your production code. Specify a root dir with &lt;jsSrcDir&gt; then filter subfolders in and out with &lt;sourceIncludes&gt; and &lt;sourceExcludes&gt;</li>
<li>Spec files &ndash; containing the tests themselves. Same principle, specify a root dir with &lt;jsTestSrcDir&gt; then filter subfolders in and out</li>
</ul>
<h2>Running the plugin in your Maven build</h2>
<pre>mvn package</pre>
<div><span class="Apple-style-span" style="font-size: 18px; line-height: 27px;">Running your tests in a &lsquo;real&rsquo; browser</span></div>
<p>The plugin also&nbsp;automagically creates an HTML page in your Maven target folder &ndash; /target/jasmine/ManualSpecRunner.html</p>
<p>You can open this page in your browser as you develop to get quick feedback on whether your tests are green or red (ie just F5 the page to re-run the tests, no re-build necessary).</p>',NULL,'2011-05-10 00:00:00.000000','t','2014-12-28 21:23:41.276202','2014-12-28 21:23:41.276202',NULL,NULL);
INSERT INTO `articles` VALUES ('13','Dashboard visualisations using vector graphics','<p><strong><a href="http://eonenergyfit.com">E.ON Energy Fit</a> &ndash; a national energy saving campaign. Developed at <a href="http://lbi.com" target="_blank">LBi</a></strong></p>
<p><em><strong>I used:</strong> Javascript | Rapha&euml;l&nbsp;| SVG | Ajax</em></p>
<p><a title="E.ON Energy Fit - Dashboard" href="http://eonenergyfit.com"><img class="aligncenter size-full wp-image-175" src="http://jonnywyatt.files.wordpress.com/2011/05/grab_eonenergy1.png?w=645" alt="E.ON Energy Fit - dashboard" /></a></p>
<p>E.ON&rsquo;s Energy Fit campaign encourages their customers to set home energy saving goals.</p>
<p>I created the &lsquo;circular graph&rsquo; visualisations featured on the customer&rsquo;s dashboard, showing progress towards those goals.</p>','<p>The agency had eschewed Flash in favour of SVG graphics (with VML for Internet Explorer), via the <a href="http://raphaeljs.com/">Rapha&euml;l</a>&nbsp;javascript library. The vector nodes created are true DOM elements allowing event attachment, opacity changes etc.</p>
<p>After getting up to speed with basic arc drawing I initialised the graphs with JSON data stored in HTML5 data- attributes.</p>
<p>One of the visualisations used a face in its centre to represent the score &ndash; the higher the score, the bigger the grin. I translated a number into a smile using a bezier curve. The bigger the score, the further I set the curve&rsquo;s two control handles from their points, deepening the grin.</p>
<p><a title="E.ON Energy Fit - goals" href="http://eonenergyfit.com"><img class="aligncenter size-full wp-image-175" title="" src="http://jonnywyatt.files.wordpress.com/2011/05/grab_eonenergy_goals1.png?w=645" alt="E.ON Energy Fit - goals" /></a></p>
<p>The goals themselves (eg. &ldquo;Use more energy saving lightbulbs&rdquo;) were presented as playing cards laid out side-by-side. If you set a goal its card would flip over to show you the feedback. This was progressively enhanced with form posts / page reloads for those without javascript and Ajax for those with.</p>',NULL,'2010-12-01 00:00:00.000000','t','2014-12-28 21:26:03.893850','2014-12-28 21:27:08.132540',NULL,NULL);
INSERT INTO `articles` VALUES ('14','Android app – Google Maps & Flickr photos','<p><strong>A native Android app using Javascript / HTML / CSS, created using Phonegap.</strong></p>
<p><em><strong>I used:</strong> Javascript | MVC | Phonegap | Flickr &amp; Google Maps APIs</em></p>
<p><img class="aligncenter size-full wp-image-176" title="" src="http://jonnywyatt.files.wordpress.com/2011/05/grab_geo1.jpg?w=645" alt="Android app featuring geolocation" /></p>','<p>I wanted to achieve a few things with this personal mini-project:</p>
<ul>
<li>Work with the geolocation API and maps cos they&rsquo;re so damn cool!</li>
<li>Mash this with geolocated Flickr images so the user can see how other people have viewed things at their current location. I know this has been done by lots of people but this was about fun and learning for me not breaking new ground :o)</li>
<li>Having read the best explanation I&rsquo;d yet found of client-side MVC in Kyle Loudon&rsquo;s <a href="http://oreilly.com/catalog/9780596803032">Developing Large Web Applications</a> book, to try to code one up and understand it better. I wanted to update multiple &lsquo;views&rsquo; and route data calls through a separate &lsquo;model&rsquo;.</li>
</ul>
<p>The first roll of this was as a simple web page, using a geolocation library and Google Gears as a fallback. Then I bought my first smartphone (Android HTC Desire) and was blown away, so I wanted to access the native geolocation functionality on that. I discovered I could use a wrapper technology like <a href="http://www.google.co.uk/url?sa=t&amp;source=web&amp;cd=1&amp;sqi=2&amp;ved=0CCwQFjAA&amp;url=http%3A%2F%2Fphonegap.com%2F&amp;ei=JhLDTYaCKNSwhAfenrikBQ&amp;usg=AFQjCNG1ra7Js9Qo6QGHtSOloIx4qGEnOA">Phonegap </a>or <a href="http://www.appcelerator.com">Titanium</a> to house my mini webapp inside a native app, giving access to the mobile device functionality.</p>
<p>I went for Phonegap. It&rsquo;s a bit of a tortuous setup with several components (Android SDK, Emulator, Eclipse plugin, Java SDK); but the moment when you get the app finally deployed to your smartphone and see it run is worth it all, trust me <span class="wp-smiley wp-emoji wp-emoji-smile" title=":)">:)</span></p>',NULL,'2010-07-04 00:00:00.000000','t','2014-12-28 21:30:11.080338','2014-12-28 21:30:11.080338',NULL,NULL);
INSERT INTO `articles` VALUES ('15','Espresso Education','<p><strong>Espresso Education &ndash; Primary Schools service (subscription only)</strong></p>
<p><img class="aligncenter size-full wp-image-178" title="Content loaded with Ajax" src="http://jonnywyatt.files.wordpress.com/2011/05/grab_resource_box1.jpg?w=645" alt="Content loaded with Ajax" /></p>
<p>XML based content was loaded into carousels and lightboxes from XML data. Each resource still has its own bookmarkable URL.</p>
<p>I built this as a format that could be easily reused by editorial staff, as they only needed to supply a populated XML file (later to be CMS driven) for the page to render.</p>
<p>Ideally all content would be rendered on the server &ndash; client-side rendering is slower and less robust due to the vagaries of the browser environment. It also breaks if Javascript is disabled. However with Espresso at the time, no real server side processing was available so this was the only possible route to dynamic content.</p>',NULL,NULL,'2010-02-20 00:00:00.000000','t','2014-12-28 21:32:30.676987','2014-12-28 21:32:30.676987',NULL,NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
COMMIT;
