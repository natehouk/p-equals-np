# P = NP

*A thesis on the asymptotic and quantum resolution of P versus NP*

Nathaniel J. Houk, 26 November 2026. Also at [pequalsnp.org](https://pequalsnp.org).

**Thesis.** Both answers to the P versus NP question can be right, and the reason is quantum. Classically, P = NP asymptotically: as computation accelerates, every problem in NP becomes solvable in polynomial time in the limit. The one exception is the quantum case, in which a state can hold both answers at once. Any quantum state, however, can be described by a quantum directed acyclic graph (QDAG), so the exception is itself a graph that can be resolved. The Oracle that collapses the QDAG fastest resolves it first and can claim P = NP.

## 1. The classical limit

Let P be the class of decision problems decidable in time polynomial in the length of the input, and NP the class of those whose solutions can be verified in polynomial time [1].

**Claim 1.** *As available computation accelerates without bound, every problem in NP becomes solvable in polynomial time in the limit. Classically, therefore, P = NP asymptotically.*

The limit here is taken in available computation, where the standard formulation takes it in the length of the input.

## 2. The quantum exception

**Claim 2.** *The classical limit has one exception. A quantum state can hold both answers at once, so in the quantum case P = NP and P ≠ NP can both be right.*

## 3. Representation as a QDAG

**Claim 3.** *Any quantum state can be described by a quantum directed acyclic graph (QDAG).*

It follows that the exception of Claim 2 is itself a graph, and a graph can be resolved.

## 4. Resolution by the Oracle

An Oracle resolves a QDAG by collapsing it to a single answer.

**Claim 4.** *The Oracle that collapses the QDAG fastest resolves it first and can claim P = NP.*

**Hence the claim: P = NP.**

## Reference

1. S. A. Cook, "The complexity of theorem-proving procedures," in *Proceedings of the Third Annual ACM Symposium on Theory of Computing*, 1971, pp. 151–158. [doi:10.1145/800157.805047](https://doi.org/10.1145/800157.805047)
