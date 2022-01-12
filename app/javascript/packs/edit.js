var btn = document.getElementById("clipboard-btn");

function justnow(text) {
  navigator.clipboard.writeText(text).then(
    function () {
      btn.innerHTML = "Copied!";
      console.log("Async: Copying to clipboard was successful!");
    },
    function (err) {
      console.error("Async: Could not copy text: ", err);
    }
  );
}

btn.addEventListener("click", function () {
  justnow(data.url);
});

let preview = document.getElementById("preview-btn");

preview.addEventListener("click", function () {
  window.open(data.url, "_blank");
});
