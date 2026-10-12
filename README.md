# Debby — A Computational Interpretation

## Project Overview

**Debby** is an experimental computational interpretation inspired by *Waltz for Debby* by Bill Evans. Created with Sonic Pi 5, the project explores how musical ideas can be represented and shaped through code, with a focus on the relationship between pitch patterns, timing, phrasing, and synthesis.

Rather than attempting to recreate the original performance, this project explores how aspects of musical expression can be approached through a programmable instrument.

## Creative Approach

The project explores several aspects of music programming and sound design:

- Synth selection and timbral variation.
- Rhythmic patterns, note durations, and phrase timing.
- Explicit control over voicings, phrasing, and note sequences.
- Amplitude, release, sustain, and pitch transposition.
- Audio effects, including reverb, high-pass filtering, and low-pass filtering.
- Generative phrase construction as an alternative to direct, note-by-note control.

A central part of the process is exploring the balance between reusable generative systems and direct musical control. Generative rules can make musical structures easier to reuse, while explicit arrangements allow individual notes, timings, and phrasing decisions to be shaped more deliberately.

## Development Versions

The repository preserves four separate Ruby source files, documenting different stages and approaches explored during development.

- **`debby_01.rb` — Initial arrangement**  
  An early version built around a `live_loop`, explicit musical phrases, a chord progression, and the `:pretty_bell` and `:sine` synths.

- **`debby_02_with_generative_engine.rb` — Generative approach**  
  An experimental implementation introducing a reusable phrase-playing function, amplitude contours, emphasis on the highest note in a phrase or chord, parameterized rhythms, transposition, and an explicit outro.

- **`debby_03.rb` — Explicit arrangement**  
  An alternative approach that returns to direct control through `play_pattern_timed`, rather than relying on the generative phrase engine. It includes an anchor bass line, an effects chain, a sequential arrangement, and a more explicitly composed outro.

- **`debby_04_latest.rb` — Structured arrangement and sound design**  
  A refinement of the explicit arrangement approach, organizing the composition into named sections while developing synth changes, envelope settings, filtering, reverb, and amplitude control.

These files are preserved as distinct implementations rather than presented as a strictly verified, linear development history. In particular, the generative and explicit approaches represent different directions in the exploration.

## How to Run

1. Install and open **Sonic Pi 5**.
2. Open one of the `.rb` files using **File → Open**.
3. Run the code using **Run** or `Alt+R`.
4. To stop playback, use **Stop** or `Alt+S`.

Start with `debby_01.rb` to explore the initial arrangement, or try `debby_04_latest.rb` for the more structured arrangement and sound design.

Run each file as a separate program to avoid mixing function definitions, synth settings, and musical arrangements between versions.

## License and Attribution

The original source code in this repository is licensed under the [MIT License](LICENSE). You are free to use, copy, modify, merge, publish, distribute, sublicense, and sell copies of the code, subject to the terms and conditions of the license.

This project is an independent computational interpretation inspired by *Waltz for Debby*, associated with composer and pianist Bill Evans. It explores musical expression through code, including pitch patterns, timing, phrasing, synthesis, and sound design.

The MIT License applies to the original code in this repository only. It does not grant rights to the original musical composition, any third-party recordings, or other materials not owned by the repository's author. Those materials may be subject to separate copyright and licensing requirements.

This project is not an official transcription, recording, or publication of the original work.
