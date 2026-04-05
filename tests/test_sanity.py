from pathlib import Path

def test_terraform_exists():
    assert Path("terraform/main.tf").exists()
def test_k8s_has_manifests():
    ymls = list(Path("k8s").rglob("*.yml"))
    assert len(ymls) >= 5