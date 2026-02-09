# Datasets & Benchmarks Papers

Datasets and Benchmarks papers differ from regular empirical papers in that you're not necessarily presenting a method
or hypothesis and giving evidence for it.
Instead these papers work as service to the community: allowing others to make progress on some problem that they
were previously unable to, or highlighting some failure mode that would be good to be improved.
You can still follow most of the structure in this template but it's also worth thinking about what might change
in your case.

Here are some Datasets and Benchmarks papers that I'd recommend reading to get a sense of the way these papers are typically structured:

- [PRISM](https://arxiv.org/pdf/2404.16019)
- [SimpleStories](https://arxiv.org/abs/2504.09184)
- [SAEBench](https://arxiv.org/abs/2503.09532)
- [SWEBench](https://arxiv.org/abs/2310.06770)

Ideally you want to:

1. Show why there is a need for this dataset/benchmark and what insight that you have that made you build this
   1. This is similar to a Background section in an empirical paper
2. Detail how you built the dataset/benchmark and how it's intended to be used
   1. This is similar to the Methods/Experimental Setup in an empirical paper
3. Evaluate the existing models on your benchmark and compare their performance. This acts as baselines for future work building on your paper
   1. This is similar to the Results section in an empirical paper.
4. Add some Discussion and Related Work

If your paper is proposing an LLM eval, then you want to be clear about the
[Construct that you're evaluating](https://arxiv.org/abs/2511.04703).
Some advice on how to think about this is given [here](https://arxiv.org/abs/1904.12437?utm_source=chatgpt.com) and [here](https://arxiv.org/abs/2411.12990).
There are also checklists for Benchmarks papers that you should consult and make sure
that you meet these criteria: your conference will provide you with a checklist and
you should also look at [BetterBench](https://arxiv.org/abs/2411.12990)
Clear documentation, accessibility and evidence that your eval can't be gamed are essential.
Often evidence that your dataset/benchmark took a lot of manual effort to compile
is also useful - if not then it's typically a weaker contribution.

Additional advice:

- Be explicit about data provenance, licensing, and consent. Include a short dataset statement or
   data card with known limitations and intended use.
- Describe how you avoid leakage, contamination, or shortcut signals (train/test overlap, metadata
   artifacts, or annotation biases). Show the checks that you ran.
  - If possible, include a hidden test set or a private leaderboard.
- Plan for maintenance, ideally by the first author over time.
- The value in a eval paper is it becoming standardised as a way to distinguish performance.
  So (possibly even more than other papers) it's very worth spending a lot of effort on
  socialising your work and ensuring that others use your eval.

Datasets & Benchmarks papers are typically underrated by researchers but are very impactful and
very highly cited: would recommend researching a lot of impactful papers here and to ensure that
you can make an impactful contribution!
