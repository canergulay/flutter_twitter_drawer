
Unlike normal Drawers we mostly use, Twitter uses a different approach for the drawer in IOS, which we can't obtain via the drawer flutter provides.

Thus, we have to use Stack and AnimatedBuilder to build such a drawer.

![Image](https://user-images.githubusercontent.com/79410189/128628419-4611338d-36f2-40a6-9544-ec8e12dae400.png)

All we do is to keep drawer at the left of the screen, and move to the right both drawer and the actual page simultaneously.
