# test-vue-tsx
Using tsx to develop vue.js applications!

# Usage

### Install the scripts

First, change to your source directory and download the script with `wget`:

`wget -q -O - https://raw.githubusercontent.com/Ronmi/test-vue-tsx/master/install.sh | bash`

or `curl`:

`curl https://raw.githubusercontent.com/Ronmi/test-vue-tsx/master/install.sh | bash`


### Update typescript compiler options

Add two properties to compiler options in your `tsconfig.json`:

```
"jsx": "react",
"reactNamespace": "JSX"
```

### Hack the JSX type checking

You only need this step if you have `"noImplicitAny": true` in your `tsconfig.json`.

Add this line of code in your application entry file:

```ts
import "./jsxdef";
```

### Happy JSXing

```tsx
// This line is REQUIRED in EVERY file using JSX syntax.
import * as JSX from "./jsx";

Vue.component("my-list", {
    template: (
        <div>
            <ul>
                <li v-for="entry of entries" track-by="id">
                    <span>{`{{entry.id}}`}:</span>
                    <span v-bind_class="getClasses(entry)" v-on_click="handleClick(entry)">{`{{entry.text}}`}</span>
                </li>
            </ul>
        </div>
    ),
    props: ["entries"],
});
```

Take care of the stupid braces and `v-bind_`/`v-on_`:

- braces, `:`, `@` are keywords jn JSX.
- `v-bind_` is replaced by `:` in generated template string.
- `v-on_` is replaced by `@`.