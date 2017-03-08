import hy
import hy.cmdline
import pytest


class HyFunction(pytest.Function):
    def getmodpath(self, stopatmodule=True, includemodule=False):
        chain = self.listchain()
        chain.reverse()
        parts = []
        for node in chain:
            if isinstance(node, pytest.Instance):
                continue
            name = node.name
            if isinstance(node, pytest.Module):
                assert name.endswith(".hy")
                name = name[:-3]
                if stopatmodule:
                    if includemodule:
                        parts.append(name)
                    break
            parts.append(name)
        parts.reverse()
        s = ".".join(parts)
        return s.replace(".[", "[")


class HyModule(pytest.Module):
    Function = HyFunction


def pytest_collect_file(path, parent):
    if path.ext == ".hy":
        return HyModule(path, parent)
