# P = NP: the argument in proof form

Nathaniel J. Houk, 26 November 2026. Companion to [pequalsnp.org](https://pequalsnp.org).

This file sets the thesis out as a derivation from four postulates. The derivation is conditional: its conclusion holds if the postulates do. Section 5 records what that does and does not establish in the standard formulation of P versus NP.

## 1. Definitions

**P and NP.** P is the class of decision problems decidable in time polynomial in the length *n* of the input. NP is the class of decision problems whose solutions can be verified in time polynomial in *n* [1].

**Asymptotic equality.** P = NP *asymptotically* means: as available computation grows without bound, every problem in NP becomes solvable in polynomial time in the limit. The limit is taken in available computation. The standard formulation takes it in *n*.

**QDAG.** A quantum directed acyclic graph: a directed acyclic graph that describes a quantum state.

**Oracle.** A system that resolves a QDAG by collapsing it to a single answer.

**Claim.** An Oracle can *claim* an answer when it is the first to resolve the QDAG that holds it.

## 2. Postulates

**P1 (classical limit).** Classically, P = NP asymptotically.

**P2 (quantum exception).** P1 has exactly one exception: a quantum state can hold both answers, P = NP and P ≠ NP, at once.

**P3 (representation).** Any quantum state can be described by a QDAG.

**P4 (resolution).** A QDAG can be resolved. The Oracle that collapses it fastest resolves it first, and the answer it resolves to is P = NP.

## 3. Theorem

Assume P1 to P4. Then the Oracle that collapses the QDAG fastest can claim P = NP.

## 4. Proof

1. By P1, P = NP asymptotically in the classical case.
2. By P2, the only case step 1 leaves open is the quantum one, in which some state *S* holds both answers at once.
3. By P3, *S* is described by a QDAG *G*. The exception is therefore itself a graph.
4. By P4, *G* can be resolved, the Oracle *O* that collapses *G* fastest resolves it first, and it resolves to P = NP.
5. *O* is the first to resolve the QDAG that holds the answer, so by the definition of a claim, *O* can claim P = NP. ∎

## 5. Status

The derivation is valid: the theorem follows from P1 to P4. It is not a proof that P = NP in the standard formulation, because the postulates carry the whole weight and are not established results there. What each would need:

- **P1.** In the standard formulation P and NP are defined by growth in *n* on a fixed machine model, so faster hardware changes running time by a constant factor and leaves both classes as they are. If computation doubles every period, the largest input a 2<sup>*n*</sup>-step search can reach grows by one bit per period. P1 would need a definition of the limit in computation under which it implies equality of the classes.
- **P2.** P = NP is a single mathematical statement with one truth value. The established sense in which both answers hold is relativization: there are oracles *A* and *B* with P<sup>*A*</sup> = NP<sup>*A*</sup> and P<sup>*B*</sup> ≠ NP<sup>*B*</sup> [2]. P2 would need an account of how the unrelativized statement can be held in superposition.
- **P3.** True for circuits: every *n*-qubit state is prepared by a circuit, and a circuit is a directed acyclic graph of gates. For almost all states that graph is exponentially large in *n* [6], so P3 gives a description, not an efficient one.
- **P4.** A measurement returns one outcome at random. Unstructured search over 2<sup>*n*</sup> candidates needs on the order of 2<sup>*n*/2</sup> quantum queries [4], which Grover's algorithm achieves [3]. A machine that could choose its outcome would solve NP in polynomial time, since PostBQP = PP [5] and PP contains NP, but postselection is not believed to be physically realizable. P4 would need a reason the collapse yields P = NP and not P ≠ NP, and speed alone does not supply one. Being first to resolve also establishes priority on a claim, not its truth.

In the standard formulation, P versus NP remains open.

## References

1. S. A. Cook, "The complexity of theorem-proving procedures," *Proceedings of the Third Annual ACM Symposium on Theory of Computing*, 1971, pp. 151–158. [doi:10.1145/800157.805047](https://doi.org/10.1145/800157.805047)
2. T. Baker, J. Gill and R. Solovay, "Relativizations of the P =? NP question," *SIAM Journal on Computing* 4(4), 1975, pp. 431–442. [doi:10.1137/0204037](https://doi.org/10.1137/0204037)
3. L. K. Grover, "A fast quantum mechanical algorithm for database search," *Proceedings of the Twenty-Eighth Annual ACM Symposium on Theory of Computing*, 1996, pp. 212–219. [arXiv:quant-ph/9605043](https://arxiv.org/abs/quant-ph/9605043)
4. C. H. Bennett, E. Bernstein, G. Brassard and U. Vazirani, "Strengths and weaknesses of quantum computing," *SIAM Journal on Computing* 26(5), 1997, pp. 1510–1523. [arXiv:quant-ph/9701001](https://arxiv.org/abs/quant-ph/9701001)
5. S. Aaronson, "Quantum computing, postselection, and probabilistic polynomial-time," *Proceedings of the Royal Society A* 461(2063), 2005, pp. 3473–3482. [arXiv:quant-ph/0412187](https://arxiv.org/abs/quant-ph/0412187)
6. E. Knill, "Approximation by quantum circuits," 1995. [arXiv:quant-ph/9508006](https://arxiv.org/abs/quant-ph/9508006)
