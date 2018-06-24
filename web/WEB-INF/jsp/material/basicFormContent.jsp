<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 2018/6/25
  Time: 0:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="form-group row">
    <label class="col-2 col-form-label text-right" style="font-weight: bold;">编号:</label>
    <div class="col-lg-8"><input class="form-control" type="text" name="NO"></div>
</div>

<div class="form-group row">
    <label class="col-2 col-form-label text-right" style="font-weight: bold;">名称:</label>
    <div class="col-lg-8"><input class="form-control" type="text" name="name"></div>
</div>

<div class="form-group row">
    <label class="col-2 col-form-label text-right" style="font-weight: bold;">生产厂商:</label>
    <div class="col-8">
        <select class="form-control" type="text" name="producer">
            <option value="厂家1" selected>厂家1</option>
            <option value="厂家2">厂家2</option>
            <option value="厂家3">厂家3</option>
            <option value="厂家4">厂家4</option>
        </select>
    </div>
</div>

<div class="form-group row">
    <label class="col-2 col-form-label text-right" style="font-weight: bold;">规格:</label>
    <div class="col-8">
        <input class="form-control" type="text" name="specification">
    </div>
</div>

<div class="form-group row">
    <label class="col-2 col-form-label text-right" style="font-weight: bold;">型号:</label>
    <div class="col-lg-8"><input class="form-control" type="text" name="model"></div>
</div>

<div class="form-group row">
    <label class="col-2 col-form-label text-right" style="font-weight: bold;">单位:</label>
    <div class="col-md-8"><input class="form-control" type="text" name="unit"></div>
</div>

<div class="form-group row">
    <label class="col-2 col-form-label text-right" style="font-weight: bold;">适用行业:</label>
    <div class="col-md-8">
        <select class="form-control" name="suitFor">
            <option value="农作物种植业" selected>农作物种植业</option>
            <option value="林业">林业</option>
            <option value="畜牧业">畜牧业</option>
            <option value="渔业">渔业</option>
            <option value="农林牧渔服务业">农林牧渔服务业</option>
        </select>
    </div>
</div>