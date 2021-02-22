+++
title = "Express merge params"
date = "2020-11-20"
tags = ["node.js"]
+++

In most REST based [Express.js](https://expressjs.com/) applications, nesting routers as middleware is commonplace. To keep the parent `req.params`, you need to add `{ mergeParams: true }` in to the child router.

{{< highlight js >}}
// blog.js
router.use('/:id/comments' commentsRoutes);

// comments.js
const router = express.router({ mergeParams: true });

router.get('/', (req, res) => {
  console.log(req.params.id);
});
{{< /highlight >}}