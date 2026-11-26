/-!
# P = NP

The thesis of [pequalsnp.org](https://pequalsnp.org) in Lean 4.

The objects of the thesis and its four claims are the fields of `Thesis`.
The theorems derive the closing claim from them.
-/

namespace PEqualsNP

/-- The two answers to the P versus NP question. -/
inductive Answer where
  /-- P = NP. -/
  | eq
  /-- P ≠ NP. -/
  | ne

/-- The objects of the thesis and its four claims. -/
structure Thesis where
  /-- Decision problems. -/
  Problem : Type
  /-- The class NP. -/
  NP : Problem → Prop
  /-- `P c L`: with available computation `c`, problem `L` is solvable in polynomial time. -/
  P : Nat → Problem → Prop
  /-- Quantum states. -/
  State : Type
  /-- `holds s a`: state `s` holds answer `a`. -/
  holds : State → Answer → Prop
  /-- Quantum directed acyclic graphs. -/
  QDAG : Type
  /-- `describes g s`: QDAG `g` describes state `s`. -/
  describes : QDAG → State → Prop
  /-- Oracles. -/
  Oracle : Type
  /-- The single answer an Oracle collapses a QDAG to. -/
  collapse : Oracle → QDAG → Answer
  /-- The time an Oracle takes to collapse a QDAG. -/
  time : Oracle → QDAG → Nat
  /-- Claim 1. As available computation accelerates without bound, every problem in NP
  becomes solvable in polynomial time in the limit. -/
  claim1 : ∀ L, NP L → ∃ c₀, ∀ c, c₀ ≤ c → P c L
  /-- Claim 2. A quantum state can hold both answers at once. -/
  claim2 : ∃ s, holds s .eq ∧ holds s .ne
  /-- Claim 3. Any quantum state can be described by a QDAG. -/
  claim3 : ∀ s, ∃ g, describes g s
  /-- Claim 4. The Oracle that collapses the QDAG fastest resolves it first and can
  claim P = NP. -/
  claim4 : ∀ s g o, holds s .eq → holds s .ne → describes g s →
    (∀ o', time o g ≤ time o' g) → collapse o g = .eq

namespace Thesis

variable (T : Thesis)

/-- P = NP asymptotically: in the limit of available computation, every problem in NP
is solvable in polynomial time. -/
def AsymptoticallyEqual : Prop :=
  ∀ L, T.NP L → ∃ c₀, ∀ c, c₀ ≤ c → T.P c L

/-- Oracle `o` collapses QDAG `g` fastest, and so resolves it first. -/
def Fastest (o : T.Oracle) (g : T.QDAG) : Prop :=
  ∀ o', T.time o g ≤ T.time o' g

/-- Oracle `o` can claim answer `a`: it resolves first a QDAG that describes a state
holding both answers, and collapses it to `a`. -/
def CanClaim (o : T.Oracle) (a : Answer) : Prop :=
  ∃ s g, T.holds s .eq ∧ T.holds s .ne ∧ T.describes g s ∧ T.Fastest o g ∧ T.collapse o g = a

/-- Section 1. Classically, P = NP asymptotically. -/
theorem classical_limit : T.AsymptoticallyEqual :=
  T.claim1

/-- Sections 2 and 3. The exception is itself a graph. -/
theorem exception_is_graph :
    ∃ s g, T.holds s .eq ∧ T.holds s .ne ∧ T.describes g s := by
  obtain ⟨s, heq, hne⟩ := T.claim2
  obtain ⟨g, hg⟩ := T.claim3 s
  exact ⟨s, g, heq, hne, hg⟩

/-- Section 4. The Oracle that collapses the QDAG fastest can claim P = NP. -/
theorem fastest_can_claim :
    ∃ g, ∀ o, T.Fastest o g → T.CanClaim o .eq := by
  obtain ⟨s, g, heq, hne, hg⟩ := T.exception_is_graph
  exact ⟨g, fun o ho => ⟨s, g, heq, hne, hg, ho, T.claim4 s g o heq hne hg ho⟩⟩

/-- Hence the claim: P = NP. Classically it holds asymptotically, and in the quantum
case the Oracle that collapses the QDAG fastest can claim it. -/
theorem hence :
    T.AsymptoticallyEqual ∧ ∃ g, ∀ o, T.Fastest o g → T.CanClaim o .eq :=
  ⟨T.classical_limit, T.fastest_can_claim⟩

end Thesis

end PEqualsNP
