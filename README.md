# LaTeX Template for Empirical ML/AI Safety Papers

[Template by Kola Ayonrinde]

## About

This repository contains a LaTeX template for empirical machine learning papers.
The repo is set up so that you can focus on writing the content of your paper, rather than worrying about structure and formatting.
We also provide some opinionated guidelines for how to arrange and conceptualise your paper: each section .tex file has comments on what to include.

The `helpers/` folder contains a series of `.md` files to use before you start writing your paper - detailing the key point, outline and raw notes.

This template should help you effectively and efficiently achieve narrative structure, clarity and coherence.
Ideally you'd also like your paper to be beautiful, creative, empirically/theoretically groundbreaking and containing elegant rhetorical flourishes.
We will not necessarily help with those last points and occasionally for very creative works, you might want to break some of the guidelines we suggest.
Being mentored by a great researcher is probably the best way to learn how to write beautiful papers.

## Table of Contents

- [About](#about)
- [Table of Contents](#table-of-contents)
- [Usage](#usage)
- [To Watch](#to-watch)
- [Tips for the Writing Process](#tips-for-the-writing-process)
- [Structure](#structure)
- [General Writing Advice](#general-writing-advice)
- [Checklist](#checklist)
- [Arxiv Submissions](#arxiv-submissions)
- [Figures and Charts](#figures-and-charts)
- [Acknowledgements](#acknowledgements)
- [Reference Papers](#reference-papers)
- [Contributions](#contributions)

## Usage

This project is a template so you can use it to start your own paper with GitHub's template feature (at the top right of screen).

<!-- > [!IMPORTANT]
> This is important! -->

## To Watch

I very much recommend watching [this video](https://www.youtube.com/watch?v=qNlwVGxkG7Q) before you start writing your paper and [this video](https://www.youtube.com/watch?v=a1zDuOPkMSw&pp=ygUVeW91IGFuZCB5b3VyIHJlc2VhcmNo) before you choose your research topic.
I love [this video](https://www.youtube.com/watch?v=vtIzMaLkCaM&pp=ygUTd3JpdGluZyBlZmZlY3RpdmVseQ%3D%3D) for general writing advice.
You should also try and read (and review) as many papers in your subfield as is helpful to get a sense of what works and what doesn't.

## Tips for the Writing Process

Your paper should have ONE CORE IDEA.
It can have 2-4 contributions which all serve that one main idea.
If there are actually two ideas, make it two papers.

I recommend using git as source control and GitHub's UI for managing section updates in the initial stages of your project when you're drafting sections.
Once you're in the final edit, Overleaf is a great tool for collaborative real-time editing with co-authors.

The first draft isn't the last draft, a few rounds of editing (with beta-readers and co-authors) will make your paper much stronger.

You should draft your Abstraction and Introduction before while or before doing your research.
This will helps focus the experiments and analysis on the key story of the work.
Writing papers is an integral part of the research process, not just a way to communicate the results after the fact.
Writing the intro forces you to be clear and focused, to see what you don't understand/can't motivate immediately and opens the dialogue with collaborators who you may not have whiteboarded with.

Before you start writing, it's worth having a rough notes file with all the things that you want to say and experiments that you want to run.
Much of this will probably make it into the first draft.
In general outlining saves much time in the long run - having a P1, P2 --> C style argument written down in your first draft is typically useful.

Outlining is also good because it helps the paper feel concrete!

Paper Timeline:

1. Before the paper: Collect some notes on the idea and start talking with collaborators. You can dump these notes in `helpers/raw_notes.md`.
2. Do some initial validating experiments
3. It's okay to bail here if things don't look promising! Not every idea has to become a paper; you can totally pivot to something more worthwhile.
4. If you decide to go ahead then start filling out the the helpers folder. It can also be helpful to share round a 1-page Google Doc with collaborators to get everyone on the same page (even before the outline). The core idea here is, like in chess, to start with the end in mind. It's much easier to scope a project and realise what experiments are important when you can imagine how they look in the final paper. 
5. Write the abstract and introduction and share these with collaborators. These are not set in stone but it helps to have something to ground yourself to. One good way to generate an initial abstract and introduction is to start talking about your paper with a friend, preferably someone who's not in your precise field. Then transcribe the explanation that felt most intuitive to your interlocutor.
6. Write out a paper outline with collaborators (a whiteboard session is best for this). You can use `helpers/outline.md` to host this.
7. Complete experiments whilst drafting the paper using the GitHub UI - don't worry about references at this stage you can leave placeholders. Writing the paper in order is preferred but if you feel yourself procrastinating the writing, you don't have to write from start to finish - if you knock off an easier section first for some momentum, you still have your outline so you know what you need to come back to.
8. Once you have a complete first draft, do at least one round of edits for each section with the context of the rest of the paper - the main focus of these edits will be restructuring, shortening, cutting and clarifying in that order.
9. Build up your `references.bib` and add the references into the paper
10. Share with beta-readers for feedback and do another round of edits - you're now editing for polish. Especially focus on the abstract and introduction here.
11. Finalise figures, appendices, final edits, LaTeX formatting etc. in Overleaf.
12. Print out the paper and read it aloud to yourself to catch any awkward phrasing and get ready for your submission.

It's often worth making a structure diagram (cf Sasha Rush/Michael Dean) when you have a first draft.

![alt text](notes/sasha_rush_structure.png)

## Structure

See `notes/parts_of_paper.md` for a detailed breakdown of the parts of a paper and where to focus your time.

![structure](notes/paper_structure.png)

![rules](notes/10_rules.png)

## General Writing Advice

Regular writing advice applies: keep sentences short, use active voice, avoid jargon, use simple words, use the same word for the same concept, parallelism across sentence/section structures makes things easier to read, cite generously, when you're sharing an opinion make it clear that it's speculation.
Write drunk, edit sober.

Ensure that there are no "this", "that", "these" where it's not clear what "this" refers to (the "naked this").

Use figures, colour and formatting to clarify and to highlight your core points. Use "A therefore B" syllogisms when you can - laying out the logic explicitly is often helpful for readers. 

Remember that conferences typically have an 8 page limit, fewer for workshops. This is a blessing for you - you will need to be concise. Economise your words accordingly, use the appendix for non-critical details. Simplify, always simplify.

## Checklist

Here's a checklist of checks before you submit your paper to a conference, workshop or journal:

- [ ] **Beta Readers**: Have you had at least 3 people read the paper and give feedback (ideally one senior person?). Fewer beta-readers may be acceptable if you have active co-authors. You should tell your beta-readers to be as critical as possible: Reviewer 2 will care less about your feelings so better to get the feedback now.
- [ ] **Abstract**: Does the abstract clearly state the problem, the approach, the results and the implications of the work? Rewrite the abstract from memory, ask a friend to rewrite your abstract, ask Claude to write an abstract from your paper. Compare all 4 versions and take the best bits from each.
- [ ] **Sharing**: Do you have a plan for how you're going to share the work with the community? LessWrong? Twitter? Slack channels?
- [ ] **Amy Tabb's Checklist**: [here](https://amytabb.com/tips/2019/05/09/basic-paper-submission-checklist/)

## Arxiv Submissions

When submitting your paper to arXiv remember that everything in the .tex files
will be made publicly available, even if not visible in the pdf, for example any comments that you have.
To ensure that you strip out any comments that might not be for public consumption you can use the following:

- Run the command: `latexpand submission.tex > stripped.tex`
- Extract your work into a new folder with just the necessary files:
  - `stripped.tex`, `references.bib`, style files and assets files.
- Submit this folder to arxiv
- (If necessary, get an arxiv sponsor)
- Then wait for your paper to appear online! 🎉

There are more detailed instructions for arxiv submissions
[here](https://trevorcampbell.me/html/arxiv.html) and
[here](https://www.ianhuston.net/2011/03/checklist-for-arxiv-submission/).

## Figures and Charts

Figures and charts are a critical (and often overlooked) part of communicating your idea to readers. They can often be the hooks that give readers a sense of what the takeaways are.

For each figure, first write out what you're trying to communicate with it.
Then make the figure, see if it gets the message across, refine and repeat.
Once you have the story you want write the caption.

People are attracted to beauty. Papers with beautiful visuals are more likely to re-read and re-referenced.

<!-- TODO: Add Evzen notes here -->

<!-- ## Rebuttals -->

## Acknowledgements

The advice here is based on the following resources:

- 🌟 [How To Write An Okay Research Paper - Sasha Rush](https://docs.google.com/presentation/d/1LQFVB4MiAApFh4nlksn7Z5GY1pNx07yqkZ9SSsTfa8o/pub?start=false&loop=false&delayms=60000&slide=id.g2f3dfc92f64_0_41)
- 🌟 [How To Write A Great Research Paper - Simon Peyton Jones](https://simon.peytonjones.org/great-research-paper/)
- [Writing Beautifully in LaTeX - Adam Gleave](https://www.gleave.me/post/latex-design-patterns/)
- [Paper Writing - Jennifer Widom](https://cs.stanford.edu/people/widom/paper-writing.html)
- [A Survival Guide to a PhD - Andrej Karpathy](https://karpathy.github.io/2016/09/07/phd/)
- [Advice for Authors - Jacob Steinhardt](https://bounded-regret.ghost.io/advice-for-authors/)
- [Heuristics for Scientific Writing - Zachary C. Lipton](https://www.approximatelycorrect.com/2018/01/29/heuristics-technical-scientific-writing-machine-learning-perspective/)
- [Paper Template - Alex Loftus](https://github.com/loftusa/paper_template)
- [Scientific Writing Tips - Amy Tabb](https://amytabb.com/tips/2019/12/04/listicle-scientist-tips/)
- Paper Writing Session from Gavin Leach (no link)
- [Responding to Peer Review - Matt Might](https://matt.might.net/articles/peer-review-rebuttals/)
- [LaTeX math tips - Amy Tabb](https://amytabb.com/tips/2022/02/15/latex-math-i-newly-learned/)
- [Ten simple rules for structuring papers - Mensh and Kording](https://www.biorxiv.org/content/10.1101/088278v5.full.pdf)
- [How To ML Paper - Jakob Foerster](https://www.jakobfoerster.com/how-to-ml-paper)
- [Writing Tips for PhD Students - John Cochrane](https://static1.squarespace.com/static/5e6033a4ea02d801f37e15bb/t/5f62a398731cc06411b39f48/1600299928487/phd_paper_writing.pdf)
- [Small Guide To Making Nice Tables - Markus Püschel](https://people.inf.ethz.ch/markusp/teaching/guides/guide-tables.pdf)
- [ICLR LaTeX Template](https://iclr.cc/Conferences/2025/CallForPapers)

I'm also inspired by my wonderful co-authors Michael Pearce, Lee Sharkey, Louis Jaburi, Evžen Wybitul and Joseph Miller as well as the many other people who have given me feedback on my writing.
I'm also grateful for the non-technical writing advice I've received from Darren Frost, Anna Archakova, David Perell, Michael Dean and others.

## Reference Papers

Some reference papers to look at for inspiration include:

- [OpenAI's SAEs](https://cdn.openai.com/papers/sparse-autoencoders.pdf)
- [Jump-ReLU SAEs](https://arxiv.org/pdf/2407.14435)
- [GPT-Q](https://arxiv.org/pdf/2210.17323)
- [vec2text](https://arxiv.org/pdf/2310.06816)

Reference Position Papers:

- [Differentially Private Learning](https://arxiv.org/pdf/2212.06470)

## Contributions

I'm always on the lookout for ways to improve this template, both with formatting and advice on technical writing.
If you have any suggestions, feel free to open an issue or a pull request.
I'd also love any links to either well-written papers or resources on technical writing that you'd recommend.
