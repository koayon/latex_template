# Comprehensive ML Paper Writing Guide

This guide synthesizes advice from Neel Nanda, Ethan Perez, Jacob Foerster, and Jacob Steinhardt on writing effective ML papers.


## The Narrative: Foundation of a Great Paper

A paper should present a narrative of one to three specific concrete claims that you believe to be true, building to useful takeaways. Everything else exists to support this narrative. The second pillar is rigorous evidence for why these claims are true.

**What makes a good narrative:**
- Motivate why someone should care about these claims
- Contextualize them in existing literature
- Communicate them precisely with all relevant technical detail
- Provide sufficient evidence to support them

**Crafting claims:**
- One important claim with sufficiently strong evidence can be enough for a great paper
- If you have multiple claims, choose ones that fit together in a cohesive theme
- Adjust confidence based on evidence strength: existence-proof claims, systematic claims, hedged claims, narrow claims, or guarantees
- Stronger statements make for more interesting papers but require higher standards of evidence

**Key questions for finding your narrative:**
- Which results would be most exciting to show someone?
- What seems particularly important? Why should anyone care?
- What was hard about what you did that perhaps no one else has done?

**On novelty:**
- Be extremely clear about what is and is not novel, especially in the introduction and related work
- Liberally cite relevant papers and explain how your work differs
- Depending on how novelty is framed, the same paper could seem arrogant or making a modest contribution


## Paper Structure

**Abstract (TL;DR of the entire paper):**
- First sentence: Something uncontroversially true that situates the reader in the right sub-field
- Second sentence: Something that makes clear there is a need, something unknown, or a problem to solve (conveys motivation)
- Next sentences: State the crucial contribution and why it is exciting; include key definitions for necessary jargon
- Include a concrete metric or result that shows your results are real and substantial
- Final 1-2 sentences: Remind readers why the paper matters, its implications, and how it fits the broader context

**Introduction (Extended abstract):**
- Paragraph 1: Context—what topic are we studying, what is the key motivating question, why does it matter?
- Paragraph 2: Technical background—what do we know about this problem, what established techniques does the paper rest on?
- Paragraph 3: Key contribution—what exactly is our main claim with key nuance, detail, and context?
- Paragraph 3.5: Our case—summarize the most critical evidence supporting the main claim
- Paragraph 4: Impact—what should you take away, what are the implications, why is this a big deal?
- End with a bullet-point list of contributions (concise descriptions of key claims with brief references to supporting evidence)

**Background:**
- Explain all concepts and prior work required for understanding your method
- Include a Problem Setting subsection that formally introduces the problem and notation
- Define key terms and techniques—readers have less context than you think
- If something is widespread knowledge (e.g., transformer architecture), no need to cover it, but err toward defining things

**Methods and Results:**
- Communicate information at several layers of abstraction
- Explain what your results are and how to interpret them
- Explain what you actually did for experiments in full detail
- Explain why your approach was reasonable and relevant to your claims
- Specify technical choices and their implications

**Related Work:**
- Compare and contrast—describing what another paper does is not enough
- Explain how their approach differs in assumptions or method
- If their method applies to your problem setting, include a comparison in experiments; if not, clearly state why not
- Can come after main content rather than as the second section

**Discussion/Conclusion:**
- Explain limitations of your work (crucial for scientific good practice)
- Discuss broader implications, general takeaways, and future work
- Put everything you wanted in the intro but couldn't because readers needed more context first


## Rigorous Supporting Evidence

**What good evidence looks like:**
- Good experiments distinguish between hypotheses—results should vary significantly depending on which hypothesis is true
- Quality over quantity: prioritize having at least one compelling, hard-to-deny experiment over many mediocre ones
- Diverse lines of evidence are robust—several qualitatively different experiments pointing to the same conclusion are stronger than many similar experiments

**Red-teaming your narrative:**
- Assume you've made a mistake—what is it? Assume there's a hole in your case—where is it?
- Get other researchers, especially experienced ones, to weigh in
- Extensively discuss limitations; if you notice issues, design new experiments to test for them

**Avoiding misleading evidence:**
- Track pre/post-hoc analysis: results obtained before formulating your claim are more impressive than post-hoc interpretations
- Be aware of cherry-picking, especially with qualitative evidence like case studies
- If your claim is an existence proof, one trustworthy example suffices

**Baselines are crucial:**
- Show your technique achieves better results than plausible alternatives, not just "decent" results
- Put meaningful effort into making baselines good—properly tune hyperparameters, do prompt engineering
- Resist the bias to invest more effort in making your "cool" technique look good than optimizing "boring" baselines

**Statistical rigor:**
- Don't use p < 0.05 as your threshold; papers at 0.01 < p < 0.05 often fail to replicate
- For exploratory approaches, be skeptical of any result that isn't p < 0.001
- Consider: How noisy is my experiment? What is the sample size and standard deviation? Are results clearly distinguishable from noise?

**Reproducibility:**
- Share your code to enable others to build on your work
- Ensure the codebase runs on a fresh machine
- Write a helpful README with links to key resources
- Create a notebook demonstrating how to run key components


## Figures and Tables

**Creating effective figures:**
- Ask: What exactly is the information I want someone to take away from this?
- Consider annotating graphs or emphasizing the most important line
- Include axis titles, clear captions, large enough font for axis ticks/labels (at least as large as paper text)
- Use colorblind-friendly colormaps (e.g., matplotlib viridis, "perceptually uniform" ones)
- For heatmaps: use white-at-zero color scales; for positive data starting at zero use "blues"; for positive/negative with meaningful zero use "RdBu"

**Captions:**
- Give context on what the figure shows, the nuance and intended interpretation, and key technical detail
- Ideally, the reader understands everything from just the figure and caption

**Figure placement:**
- Put an eye-catching figure on the first page—most readers decide whether to read based on that
- Explanatory diagrams can be very effective as Figure 1


## Writing Style and Clarity

**Core principles:**
- Be precise: Choose words carefully so you say what you mean; replace vague terms like "performance" with "accuracy" or "speed"
- Be concise: Most of us write in an overly wordy style; after writing initial text, try to delete around one-third of the words
- Avoid complex sentence structure: Research is already difficult; don't make it harder with run-on sentences
- Use consistent phrasing: Avoid synonyms for work-specific terminology at all costs
- Use simple language: Avoid rare words or sounding "fancy"; English is not the first language for many scientists

**Active voice:**
- Passive voice is overused, clunky, and obscures who did what—avoid it
- Never use passive tense; always specify the actor ("We find...")

**Sentence structure:**
- Put the verb as early in the sentence as possible (early verbs make sentences easier to parse)
- If a sentence gets too long, split it into two: one sentence, one idea
- Don't use long sentences with a lot of actual content; split them
- Long sentences are fine if they have simple, easy-to-understand words

**Paragraphs:**
- Lead and end paragraphs with strong, clear sentences; middle sentences are for elaboration
- Make sure every sentence adds information
- Ask about every word/sentence: "Is this necessary?" and "Can I phrase this more simply?"

**Words and phrases to remove or replace:**
- Remove: actually, a bit, fortunately, most connectives (e.g., "however"), "to our knowledge," "note that," "observe that," "try to," very/really/extremely
- Replace: want, hope, contractions ("it's" → "it is")
- Avoid words in quotation marks (a way to sneak imprecise or "dodgy" words in)
- Unfold apostrophes (X's Y → The Y of X)
- Limit hedging ("may" or "can")—hedge words should almost always be dropped

**Other style points:**
- Minimize pronouns; if you must use "this," "those," etc., use them as adjectives (e.g., "this result")
- Don't repeat similar-sounding words within a paragraph or sentence
- Don't start every sentence with "We"—add just a bit of variation
- "On the other hand" shouldn't come without "On the one hand"
- Don't use comparatives without explicitly specifying what two things are being compared
- Cite any claim not supported by your experiments; avoid grandiose language or overly broad claims
- Avoid anthropomorphisms ("knowledge") of AI algorithms
- Avoid subjective claims—adjectives are usually red flags


## LaTeX Best Practices

**Citations:**
- Use `\citet{}` when authors are part of the sentence: "Smith (2001) shows..."
- Use `~\citep{}` otherwise: "...recent work~\citep{smith2001}"
- Never write "(Smith, 2001) shows..."
- Acronym + citation: "proximal policy optimisation~\citep[PPO]{schulman2017ppo}"
- Cite the correct version—Google Scholar often defaults to arXiv rather than the conference paper

**Equations:**
- Display equations can take up space if overused; too many inline equations hurt readability
- Think carefully about which equations are worth displaying
- If you leave a blank line after `\end{equation}` or `$`, you create an extra line break
- Use `\stackrel{}` on non-trivial equality/inequality statements and justify immediately after
- Mathematical equations follow standard punctuation rules—don't forget periods and commas after equations

**Cross-references and packages:**
- Use `\usepackage[backref=page]{hyperref}` to make it easier to jump to references and back
- Use the cleveref package for intelligent cross-referencing (`\cref{}`)
- Use `\usepackage[acronym]{glossaries}` or `\usepackage{acronym}` to auto-manage acronyms
- DON'T use the fullpage package—it overrides options in many style files

**Formatting:**
- Use correct quotation marks: `` ``correct quotation'' `` or `\enquote{correct quotation}` from csquotes
- Footnotes should be after "." and ","
- Make sure `\label{}` comes after `\caption{}` in figures
- Use `\left(` and `\right)` initially, but consider explicit sizes (`\big(`, `\Big(`, `\bigg(`) in final pass
- Check for broken references (indicated by ??)
- Minimize visual white space; fill the page limit
- Avoid line breaks resulting in lines with just a single word


## Common Pitfalls

**Illusion of transparency:**
- You have spent months steeped in context; your reader has not
- Address misconceptions and possible misunderstandings, even though they feel obvious to you
- Provide context before introducing new concepts

**Overclaiming:**
- The temptation to make work sound maximally exciting is dangerous
- Competent researchers see through this
- Clearly acknowledging limitations increases respect for your work

**Cherry-picking and post-hoc analysis:**
- Present randomly selected examples for context alongside compelling ones
- Clearly track which results were obtained before vs. after formulating your claim

**Unnecessary complexity:**
- If readers don't understand your paper, they ignore it or assume it's not credible
- Use precise language, but within that constraint be as simple and accessible as possible
- You get points for quality technical insights, not for sounding fancy
