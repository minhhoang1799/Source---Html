function CustomSelect() {
    var e, t, i, n, s, r, a;
    for (e = document.getElementsByClassName("custom-select"), t = 0; t < e.length; t++) {
        for (n = e[t].getElementsByTagName("select")[0], (s = document.createElement("DIV")).setAttribute("class", "select-selected"), s.innerHTML = n.options[n.selectedIndex].innerHTML, e[t].appendChild(s), (r = document.createElement("DIV")).setAttribute("class", "select-items select-hide"), i = 1; i < n.length; i++)(a = document.createElement("a")).innerHTML = n.options[i].innerHTML, a.setAttribute("href", n.options[i].value), a.addEventListener("click", function (e) {
            var t, i, n, s, r;
            for (s = this.parentNode.parentNode.getElementsByTagName("select")[0], r = this.parentNode.previousSibling, i = 0; i < s.length; i++)
                if (s.options[i].innerHTML == this.innerHTML) {
                    for (s.selectedIndex = i, r.innerHTML = this.innerHTML, t = this.parentNode.getElementsByClassName("same-as-selected"), n = 0; n < t.length; n++) t[n].removeAttribute("class");
                    this.setAttribute("class", "same-as-selected");
                    break
                } r.click()
        }), r.appendChild(a);
        e[t].appendChild(r), s.addEventListener("click", function (e) {
            e.stopPropagation(), o(this), this.nextSibling.classList.toggle("select-hide"), this.classList.toggle("select-arrow-active")
        })
    }

    function o(e) {
        var t, i, n, s = [];
        for (t = document.getElementsByClassName("select-items"), i = document.getElementsByClassName("select-selected"), n = 0; n < i.length; n++) e == i[n] ? s.push(n) : i[n].classList.remove("select-arrow-active");
        for (n = 0; n < t.length; n++) s.indexOf(n) && t[n].classList.add("select-hide")
    }
    document.addEventListener("click", o)
}
$(document).ready(function () {
    CustomSelect()
});